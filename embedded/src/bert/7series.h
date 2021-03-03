#define WORDS_PER_FRAME 101
#define FRAMES_PER_BRAM 128
// Likely wrong for 7 series
#define DATA_DMA_OFFSET 0x1FCU

// bitstream ctrl commands
#define WORDS_BETWEEN_FRAMES 7
#define WORDS_AFTER_FRAMES 54
#define WORDS_BEFORE_FRAMES 196

// for ultrascale+
#define WE_BITS_PER_FRAME 10

extern int bitlocation[10]; // write enables
extern int bram_starts[10]; // for groups of bits
