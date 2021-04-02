#include "bert.h"

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>

#define SEVEN_SERIES

#ifdef SEVEN_SERIES
#include "7series.h"
#endif

#ifdef ULTRASCALE_PLUS
#include "ultrascale_plus.h"
#endif

// Macros to deal with uint64_t discrepancy
#ifdef __linux__
#define FMT_UINT64 "%lX"
#endif
#ifdef __APPLE__
#define FMT_UINT64 "%llX"
#endif


#include "mydesign.h" // Include the primary design file, as well as any acceleration tables if used
//#define DEBUG
#ifdef DEBUG
#define DEBUG_PRINT(fmt, args...)    fprintf(stderr, fmt, ## args)
#else
#define DEBUG_PRINT(fmt, args...)    if (verbose){fprintf(stderr, fmt, ## args);}
#endif

#define CEIL(x,y) (((x) + (y) - 1) / (y))
#define LINE_LEN 4096
#define SCRIPT_LEN 4096

#define MAX_WORD_COUNT 4608 // Assuming 1B is smallest word size
#define MAX_WIDTH 72 // Bits per word in memory 
#define ARR_SIZE (CEIL(MAX_WIDTH, 64) * MAX_WORD_COUNT)
uint64_t mem_write[NUM_LOGICAL][ARR_SIZE] = {0U};

enum {
    BIN,
    DAT
};

XFpga XFpgaInstance = {0U};
FILE* output = NULL;
FILE* input = NULL;
struct bert_meminfo ops[NUM_LOGICAL] = {0U};
bool verbose = false;
int format = BIN;

/*
* TODO:
* - Bigendian file support
* - Show file mismatch
* - Target memories besides using number indices
*/

int readWord(uint64_t* arr, int bytes, FILE* f) {
    switch (format) {
        case BIN :
            return fread(arr, bytes, 1, f);

        case DAT :
            return fscanf(f, FMT_UINT64 "\n", arr);
        default :
            fprintf(stderr, "Invalid format.\n");
            exit(1);
    }
}

void setOutput(char* fname) {
    if (output != NULL) {
        fclose(output);
        output = NULL;
    }
    output = fopen(fname, "w");
    if (output == NULL) {
      perror(fname);
      exit(1);
    }
}

void writeBitstream() {
    if (hostwrite_Init(&XFpgaInstance, IDCODE, output) != 0) { // IDCODE should be defined in mydesign.h
        printf("readback_Init failed\r\n");
        exit(1);
    }
    
    struct bert_meminfo write_ops[NUM_LOGICAL] = {0U};
    int opc = 0;
    for (int i = 0; i < NUM_LOGICAL; i++) {
        if (ops[i].operation == BERT_OPERATION_WRITE) {
            write_ops[opc].operation = ops[i].operation;
            write_ops[opc].data = ops[i].data;
            write_ops[opc].data_length = ops[i].data_length;
            write_ops[opc].start_addr = ops[i].start_addr;
            write_ops[opc].logical_mem = ops[i].logical_mem;
            opc++;
        }
    }
    DEBUG_PRINT("Transfusing %d staged memories\n", opc);
    if (bert_transfuse(opc,write_ops,&XFpgaInstance) != 0) {
        printf("bert_write failed\r\n");
        exit(1);
    }

    DEBUG_PRINT("Bitstream written to file\n");
    
    fclose(output);
    output = NULL;

    for (int i = 0; i < NUM_LOGICAL; i++) {
        if (ops[i].operation == BERT_OPERATION_WRITE) {
            
            for (int j = 0; j < ops[i].data_length; j++) {
                mem_write[i][j] = 0;
            }
            ops[i].operation = 0;
        }
    }
    fprintf(stderr, "Bitstream written\n");
}

void prepData(int mem, FILE* input) {
    if (mem < 0 || mem >= NUM_LOGICAL) {
        fprintf(stderr, "WARNING: Invalid memory index %d\n", mem);
        return;
    }
    if (input == NULL) {
        fprintf(stderr, "prepData: input is null\n");
        exit(1);
    }
    struct bert_meminfo* op = &(ops[mem]);
    struct logical_memory* logicalmem = &(logical_memories[mem]);
    int cellsPerWord = CEIL(logicalmem->wordlen,64);
    int words = logicalmem->words;
    size_t wordSize = CEIL(logicalmem->wordlen,8);
    DEBUG_PRINT("Mem %d info: wordlen: %d, cellsPerWord: %d, words: %d, wordSize: %ld\n", mem, logicalmem->wordlen, cellsPerWord, words, wordSize);
    for (int i = 0; i < words; i++) {
        int res = 0;
        int k = 0;
        for (int j = wordSize - 8; j >= 0; j -= 8) {
            res = readWord(&(mem_write[mem][i*cellsPerWord + k]), 8, input);
            if (res < 1) {
                fprintf(stderr, "Warning: File ended before filling memory %d.\n", mem);
                fprintf(stderr, "Mem %d staged for writing\n", mem);
                goto prepDataEpilogue;
            }
            DEBUG_PRINT("prepData: Staged 0x" FMT_UINT64 " in word %d of mem %d\n", mem_write[mem][i*cellsPerWord + k], i*cellsPerWord + k, mem);
            k++;
        }
        if (wordSize % 8 != 0) {
            res = readWord(&(mem_write[mem][i*cellsPerWord + k]), wordSize % 8, input);
            if (res < 1) {
                fprintf(stderr, "Warning: File ended before filling memory %d.\n", mem);
                fprintf(stderr, "Mem %d staged for writing\n", mem);
                goto prepDataEpilogue;
            }
            DEBUG_PRINT("prepData: Staged 0x" FMT_UINT64 "in word %d of mem %d\n", mem_write[mem][i*cellsPerWord + k], i*cellsPerWord + k, mem);
        }
    }
    if (!feof(input)) {
        long int fin = ftell(input);
        fseek(input, 0, SEEK_END);
        long int end = ftell(input);
        fprintf(stderr, "WARNING: File size mismatch. Input file for mem %d is larger than the memory by %ld bytes\n", mem, end - fin);
    }

    prepDataEpilogue :
    if (op->operation != 0)
        fprintf(stderr, "WARNING: Overwriting operation for mem %d\n", mem);
    op->operation = BERT_OPERATION_WRITE;
    op->data = mem_write[mem];
    op->data_length = words;
    op->start_addr = 0;
    op->logical_mem = mem;

    fprintf(stderr, "Mem %d staged for writing\n", mem);

}

void parseArgs(int argc, char** argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: bitstream_gen <input script> <opt. args>\nbitstream_gen --help for more\n");
        exit(1);
    }
    if (strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0) {
        fprintf(stderr, "BERT Bitstream Gen - matth2k@seas.upenn.edu\n"
                        "Launch args:\n\n"
                        "<input script>        Text file with one command per line that stages memories and writes bitstream\n"
                        "--help -h             Prints info\n"
                        "--verbose -v          Debug print statements (debug file reads, etc..)\n"
                        "Script Commands:\n\n"
                        "read_format <format>                       Values: bin, dat. File format used by reader when staging memories. Binary default.\n"
                        "stage <mem target/s> <mem data file>       Example: stage 0 1 5 data.bin\n"
                        "write_bitstream <output file>              Writes staged memories to a partial bitstream. Clears staged memories after.\n");
        exit(0);
    } else if (argc > 2 && (strcmp(argv[2], "--verbose") == 0 || strcmp(argv[2], "-v") == 0)) {
        verbose = true;
    }
    input = fopen(argv[1], "r");
    if (input == NULL) {
      perror(argv[1]);
      exit(1);
    }
}

void parseCMD(char* cmd) {
    char* tok[NUM_LOGICAL*2] = {0U};
    tok[0] = strtok(cmd, " ");
    int i = 1;
    if (tok[0] == NULL)
        return;
    while ((tok[i] = strtok(NULL, " ")) != NULL)
        i++;
    if (strcmp(tok[0], "add") == 0 || strcmp(tok[0], "stage") == 0) {
        FILE* hex = fopen(tok[i-1], "r");
        if (hex == NULL) {
            perror(tok[i-1]);
            exit(1);
        }
        for (int j = 1; j < i - 1; j++) {
            prepData(atoi(tok[j]), hex);
            rewind(hex);
        }
        fclose(hex);
    } else if (strcmp(tok[0], "write_bitstream") == 0) {
        if (tok[1] != NULL) {
            setOutput(tok[1]);
            writeBitstream();
        } else {
            fprintf(stderr, "write_bitstream: file arg missing\n");
            exit(1);
        }
    } else if (strcmp(tok[0], "read_format") == 0) {
        if (tok[1] != NULL) {
            if (strcmp(tok[1], "bin") == 0) {
                format = BIN;
                DEBUG_PRINT("Read format set to .bin.\n");
            } else if (strcmp(tok[1], "dat") == 0) {
                format = DAT;
                DEBUG_PRINT("Read format set to .dat.\n");
            }
        } else {
            fprintf(stderr, "read_format: format arg missing or invalid\n");
            exit(1);
        }
    } else if (tok[0][0] == '#' || tok[0][0] == '\n') {
        DEBUG_PRINT("Ignoring line\n");
    } else {
        fprintf(stderr, "WARNING: Unrecognized command %s\n", tok[0]);
    }
    
} 

void parseScript(FILE* input) {
    int matches = 0;
    char cmd[LINE_LEN] = {0U};
    DEBUG_PRINT("Parsing script...\n");
    int line = 0;
    while (fgets(cmd, LINE_LEN, input) != NULL) {
        if (cmd[strlen(cmd) - 1] == '\n')
            cmd[strlen(cmd) - 1] = '\0';
        DEBUG_PRINT("Parsing line %d '%s'\n", line, cmd);
        parseCMD(cmd);
        line++;
    }
}

int main(int argc, char **argv) {
    parseArgs(argc, argv);
    parseScript(input);

    fclose(input);

    return 0;
}