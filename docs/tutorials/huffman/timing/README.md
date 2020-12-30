# Timing

This has an alternate hellobert.c with timing operations.
* Copy the hellobert.c here instead the hellobert.c form sw_huffman.  The best way to copy is to use the GUIs.
  * Open your file browser next to the SDK window.
  * browse to `BERT/docs/tutorials/huffman/timing`
  * drag `hellobert.c` under the huffman_demo/src directory on the left pane of SDK
* uncomment `#define TIME_BERT` in `bert.h` (and save)
  * with the huffman_demo/src directory listed in the left pane on SDK, double-click bert.h
  * uncomment `#define TIME_BERT`
  * Top menu bar: File>Save
* run again; you should see timing reports with the run now.
* Times printed are
  1. total time
  2. time for read
  3. time for write
  4. time for translation to logical (from FRAME format)
  5. time for translation to physical (to FRAME format)
* FYI: small values (less than a microsecond) are null operations (just timing code overhead)



