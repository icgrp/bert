#include "../../embedded/src/bert/bert.h"
#include "../../embedded/src/bert/ultrascale_plus.h"
//#include "dummy_xilinx.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "mydesign.h" // Include the primary design file, as well as any acceleration tables if used
#define DEBUG
#ifdef DEBUG
#define DEBUG_PRINT(fmt, args...)    fprintf(stderr, fmt, ## args)
#else
#define DEBUG_PRINT(fmt, args...)
#endif

#define CEIL(x,y) (((x) + (y) - 1) / (y))
#define LINE_LEN 4096
#define SCRIPT_LEN 4096

#define MAX_WORD_COUNT 4608 // Assuming 1B is smallest word size
#define MAX_WIDTH 72 // Bits per word in memory 
#define ARR_SIZE (CEIL(MAX_WIDTH, 64) * MAX_WORD_COUNT)
uint64_t mem_write[NUM_LOGICAL][ARR_SIZE] = {0U};

XFpga XFpgaInstance = {0U};
FILE* output = NULL;
FILE* input = NULL;
struct bert_meminfo ops[NUM_LOGICAL] = {0U};
// add TARGETs DATAFILE

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
            res = fread(&(mem_write[mem][i*cellsPerWord + k]), 8, 1, input);
            if (res < 1) {
                fprintf(stderr, "Warning: File ended before filling memory %d.\n", mem);
                fprintf(stderr, "Mem %d staged for writing\n", mem);
                goto prepDataEpilogue;
            }
            DEBUG_PRINT("prepData: Staged 0x%lX in word %d of mem %d\n", mem_write[mem][i*cellsPerWord + k], i*cellsPerWord + k, mem);
            k++;
        }
        DEBUG_PRINT("Leftover bytes: %ld\n", wordSize % 8);
        if (wordSize % 8 != 0) {
            res = fread(&(mem_write[mem][i*cellsPerWord + k]), wordSize % 8, 1, input);
            if (res < 1) {
                fprintf(stderr, "Warning: File ended before filling memory %d.\n", mem);
                fprintf(stderr, "Mem %d staged for writing\n", mem);
                goto prepDataEpilogue;
            }
            DEBUG_PRINT("prepData: Staged 0x%lX in word %d of mem %d\n", mem_write[mem][i*cellsPerWord + k], i*cellsPerWord + k, mem);
        }
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
    if (argc < 3) {
        fprintf(stderr, "Usage: bitstream_gen <input script> <output bitstream>\nbitstream_gen --help for more\n");
        exit(1);
    }
    if (strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0) {
        fprintf(stderr, "BERT Bitstream Gen - matth2k@seas.upenn.edu\n"
                        "Script Commands:\n\n"
                        "add <target/s> <logical mem binary> <optional formatting>        Example: add 0 1 5 data.hex\n");
        exit(0);
    }
    input = fopen(argv[1], "r");
    if (input == NULL) {
      perror(argv[1]);
      exit(1);
    }
    output = fopen(argv[2], "w");
    if (output == NULL) {
      perror(argv[2]);
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
    if (strcmp(tok[0], "add") == 0) {
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
    } else {
        fprintf(stderr, "WARNING: Unrecognized command %s\n", tok[0]);
    }
    
} 

void parseScript(FILE* input) {
    int matches = 0;
    char cmd[LINE_LEN] = {0U};
    DEBUG_PRINT("Parsing script...\n");
    while (fgets(cmd, LINE_LEN, input) != NULL) {
        if (cmd[strlen(cmd) - 1] == '\n')
            cmd[strlen(cmd) - 1] = '\0';
        DEBUG_PRINT("Parsing %s\n", cmd);
        parseCMD(cmd);
    }
}

int main(int argc, char **argv) {
    parseArgs(argc, argv);
    parseScript(input);

    
    if (hostwrite_Init(&XFpgaInstance, IDCODE, output) != 0) { // IDCODE should be defined in mydesign.h
        printf("readback_Init failed\r\n");
        exit(1);
    }
    DEBUG_PRINT("XFpga device initialized\n");
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
    DEBUG_PRINT("Transfusing %d writes\n", opc);
    if (bert_transfuse(opc,write_ops,&XFpgaInstance) != 0) {
        printf("bert_write failed\r\n");
        exit(1);
    }

    DEBUG_PRINT("Bitstream written to file\n");
    
    fclose(output);
    fclose(input);

    return 0;
}