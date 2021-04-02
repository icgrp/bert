// Idcode for Avnet Ultra96-V2 Board
#define U96_IDCODE 0x04A42093

#define WORDS_PER_FRAME 93 // Writes need 1 extra frame to flush
#define FRAMES_PER_BRAM 256
#define PAD_WORDS 25 // Words to wait before readback data starting coming out of FDRO


// bitstream ctrl commands
#define WORDS_BETWEEN_FRAMES 7
#define WORDS_AFTER_FRAMES 54
#define WORDS_BEFORE_FRAMES 196

// for ultrascale+
#define WE_BITS_PER_FRAME 12

extern int bitlocation[12]; // write enables
extern int bram_starts[13]; // for groups of bits
