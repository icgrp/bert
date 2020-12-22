# Timing

This has an alternate hellobert.c with timing operations.
* Copy instead of the hellobert.c form sw_huffman
* uncomment #define TIME_BERT in bert.h (and save)
* run again; should see timing reports
* Times printed are
  1. total time
  2. time for read
  3. time for write
  4. time for translation to logical (from FRAME format)
  5. time for translation to physical (to FRAME format)
* small values (less than a microsecond) are null operations (just timing code overhed)


