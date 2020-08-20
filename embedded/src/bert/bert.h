#define BERT_OPERATION_WRITE 1
#define BERT_OPERATION_READ 2
#define BERT_OPERATION_ACCELERATED_WRITE 3
#define BERT_OPERATION_ACCELERATED_READ 4

struct bert_meminfo {
  int logical_mem;
  int operation;
  uint64_t *data;
  int start_addr;
  int data_length;
  int lookup_quanta;
  int lookup_tables;
  int u64_per_lookup;
  int tabsize;
  void * pointer_to_trans_tables;
    
};

int  bert_read(int logicalm, uint64_t *data, XFpga* XFpgaInstance);
int  bert_write(int logicalm, uint64_t *data, XFpga* XfpgaInstance);
int  bert_write_we(int logicalm, uint64_t *data, XFpga* XfpgaInstance);
int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance);
int  bert_transfuse_we(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance);

void bert_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
			       int start_addr, int data_length, struct frame_set *the_frame_set);

void bert_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				int start_addr, int data_length, struct frame_set *the_frame_set);

void bert_accelerated_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				 int start_addr, int data_length, struct frame_set *the_frame_set,
				  int lookup_quanta,
				  int lookup_tables,
				  int u64_per_lookup,
				  int tabsize,
				 uint64_t translation_tables[][tabsize]);

void bert_accelerated_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				  int start_addr, int data_length, struct frame_set *the_frame_set,
				  int lookup_quanta,
				  int lookup_tables,
				  int u64_per_lookup,
				  int tabsize,
				  uint64_t translation_tables[][tabsize]);
