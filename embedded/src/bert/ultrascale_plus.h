// Idcode for Avnet Ultra96-V2 Board
#define U96_IDCODE 0x04A42093

#define WORDS_PER_FRAME 93
#define FRAMES_PER_BRAM 256
#define DATA_DMA_OFFSET 0x1FCU

// bitstream ctrl commands
#define WORDS_BETWEEN_FRAMES 7
#define WORDS_AFTER_FRAMES 54
#define WORDS_BEFORE_FRAMES 196

// for ultrascale+
#define WE_BITS_PER_FRAME 12

extern int bitlocation[12]; // write enables
extern int bram_starts[13]; // for groups of bits
