#define WORDS_PER_FRAME 93
#define FRAMES_PER_BRAM 256
#define DATA_DMA_OFFSET 0x1FCU

// bitstream ctrl commands
#define WORDS_BETWEEN_FRAMES 7
#define WORDS_AFTER_FRAMES 54
#define WORDS_BEFORE_FRAMES 194

// Comment out the one you want to benchmark
// One at a time

//#define TIME_TRANSLATION
#define TIME_BERT
//#define TIME_DMA

#define USE_WE
