#define SERIES7_WORDS_PER_FRAME 101
#define SERIES7_FRAMES_PER_BRAM 128
// Maybe wrong for 7 series. Haven't tried reading back through PCAP yet
//#define DATA_DMA_OFFSET 0x1FCU

// bitstream ctrl commands
#define SERIES7_WORDS_BETWEEN_FRAMES 7
#define SERIES7_WORDS_AFTER_FRAMES 54
#define SERIES7_WORDS_BEFORE_FRAMES 196

#define SERIES7_PAD_WORDS       25 

// for 7 series
#define SERIES7_WE_BITS_PER_FRAME 10
#define SERIES7_BRAM18_STARTS_PER_FRAME 20

// these get used in code produced
#define SERIES7_BITLOCATION "{142,462,782,1102,1422,1774,2094,2414,2734,3054}"
// Double check this
#define SERIES7_BRAM_STARTS "{0,320,640,960,1280,1600,1920,2240,2560,2880,3232}"
// this gets used directly
// data from Matthew 4/20/2021; notes may need work
#define SERIES7_BRAM18_STARTS {0,176,320,496,640,816,960,1136,1280,1456,1632,1808,1952,2128,2272,2448,2592,2768,2912,3088}

