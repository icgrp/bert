#include "../../embedded/src/bert/bert.h"
#include "../../embedded/src/bert/ultrascale_plus.h"
//#include "dummy_xilinx.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include "mydesign.h" // Include the primary design file, as well as any acceleration tables if used

#define CEIL(x,y) (((x) + (y) - 1) / (y))

#define WORD_COUNT 512 // Example memory's word count
#define WIDTH 72 // Bits per word in memory 
#define ARR_SIZE (CEIL(WIDTH, 64) * WORD_COUNT)
uint64_t mem_read[ARR_SIZE]; // Twos 64b words are needed for 72b
uint64_t mem_write[ARR_SIZE] = {[0 ... ARR_SIZE-1] = 0xDEADBEEF};

XFpga XFpgaInstance = {0U};

int main(int argc, char **argv) {
    FILE* f = fopen("test.bit", "w");
    if (f == NULL) {
      perror("bitstream_gen");
      exit(1);
    }
    
    if (readback_Init(&XFpgaInstance, IDCODE) != 0) { // IDCODE should be defined in mydesign.h
        printf("readback_Init failed\r\n");
        exit(1);
    }

    set_file(&XFpgaInstance, f);
    
    if (bert_write(MEM_0,mem_write,&XFpgaInstance) != 0) {
        printf("bert_write failed\r\n");
        exit(1);
    }
    
    fclose(f);

    return 0;
}