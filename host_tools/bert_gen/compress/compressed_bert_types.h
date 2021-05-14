
struct compressed_frame_range {
   int first_frame;
   int len;
   int we_bits; // BRAM18 write enables, so needs to be grouped in pairs before actually
               //  use with frame write enables that are at RAMB36 granularity
   // will need this to read newest compressed files -- looks like tolerates having it on old files?
   int has_live_ramb18_partner; // coming soon
};


struct frame_bits {
  uint16_t num_bits;
  //int frame_address;
  int16_t *bit_loc;
};
  
struct frame_sequence {
  int frame_address;
  int sequence_length;
  struct frame_bits *frame_bits;
};

struct segment_repeats {
  int num_repeats; // of first frame, since repeat length differs per frame
  int num_frames;
  int bits_in_repeat; // ? still meaningful?
  int slots_in_repeat; // ? still meaningful?
  int unique_frames_in_repeat;
  //  struct frame_bits *frame_bits;
  struct frame_sequence *frame_seq;
  int *unique_frames;
};
  
struct compressed_logical_memory {
  int nframe_ranges;
  int wordlen;
  int words;
  int replicas; // new
  int *num_segments; // per replica
  struct compressed_frame_range *frame_ranges; // across replicas
  struct segment_repeats **repeats; // array per replica
};

// for multiple frame range use
struct frame_range_offset {
  int frame_base;
  int len;
  int we_bits;
  int has_read;
  // may also need the has live partner bit
  // ...not need for convservative -- has_read is enough
  int offset;
};

struct frame_set {
  int num_ranges;
  struct frame_range_offset *ranges;
};

struct accel_memory {
  int lookup_tables;
  int u64_per_lookup;
  int lookup_quanta;
  int frame_bit_offset;
  uint64_t **trans_tables;
};
