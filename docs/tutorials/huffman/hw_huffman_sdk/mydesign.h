#include "compressed_bert_types.h"

#define NUM_LOGICAL 4

#define PART_ID 0x04A42093

#define MEM_0 0
#define MEM_1 1
#define MEM_2 2
#define MEM_3 3

#define X_PART_NUMBER "xczu3eg-sbva484-1-i" // this is the part-number for board
#undef XILINX_SERIES7
#define XILINX_ULTRASCALE
extern const char * logical_names[NUM_LOGICAL];
extern struct compressed_logical_memory logical_memories[NUM_LOGICAL];
