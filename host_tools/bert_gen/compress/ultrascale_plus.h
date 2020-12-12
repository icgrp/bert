// for UltraScale+
#define WORDS_PER_FRAME 93
#define FRAMES_PER_BRAM 256
// for 7020
 //#define WORDS_PER_FRAME 101
 //#define FRAMES_PER_BRAM 128
#define DATA_DMA_OFFSET 0x1FCU
// dummy words from pipelining
#define PAD_WORDS       25 

// making these up -- please replace
#define WORDS_BETWEEN_FRAMES 12
#define WORDS_AFTER_FRAMES 8

// for ultrascale+
#define WE_BITS_PER_FRAME 12

extern int bitlocation[12]; // write enables
extern int bram_starts[13]; // for groups of bits
extern int bram18_starts[25]; // for groups of bits
