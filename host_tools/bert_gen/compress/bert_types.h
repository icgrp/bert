struct frame_range {
   int first_frame;
   int len;
};

struct bit_loc {
   int frame; // can probably be less than 32b
   short int bit_loc; // at most 3232 bits in frame, so only need 11b
};
  
struct logical_memory {
   int nframe_ranges;
   int wordlen;
   int words;
   int replicas;
   struct frame_range *frame_ranges;
   struct bit_loc *bit_locations;
};

