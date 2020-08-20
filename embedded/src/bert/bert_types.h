struct frame_range {
   int first_frame;
   int len;
  int we_bits;
};


struct frame_bits {
  int num_bits;
  int frame_address;
  int *bit_loc;
};
  

struct segment_repeats {
  int num_repeats;
  int num_frames;
  int bits_in_repeat;
  int slots_in_repeat;
  int unique_frames_in_repeat;
  struct frame_bits *frame_bits;
  int *unique_frames;
};
  

struct logical_memory {
  int nframe_ranges;
  int wordlen;
  int words;
  int num_segments;
  struct frame_range *frame_ranges;
  struct segment_repeats *repeats;
};

// for multiple frame range use
struct frame_range_offset {
  int frame_base;
  int len;
  int we_bits;
  int has_read;
  int offset;
};

struct frame_set {
  int num_ranges;
  struct frame_range_offset *ranges;
};
