#include "xilfpga.h"
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

enum {
  BST_GENERAL_FAIL = -1,
  BST_SUCCESS,
  BST_XILFPGA_FAILURE,
  BST_OFFSET_NOT_FOUND,
  BST_UNION_FAILURE,
  BST_NULL_PTR,
  BST_EXCESS_FRAME_RANGES,
  BST_EXCESS_SEGMENTS,
  BST_EXCESS_FRAMES,
  BST_SLOT_MISMATCH,
  BST_BAD_U64_COUNT
};

int  bert_read(int logicalm, uint64_t *data, XFpga* XFpgaInstance);
int  bert_write(int logicalm, uint64_t *data, XFpga* XfpgaInstance);
//int  bert_write_we(int logicalm, uint64_t *data, XFpga* XfpgaInstance);
int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance);
//int  bert_transfuse_we(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance);

int bert_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
			       int start_addr, int data_length, struct frame_set *the_frame_set);

int bert_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				int start_addr, int data_length, struct frame_set *the_frame_set);

int bert_accelerated_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				 int start_addr, int data_length, struct frame_set *the_frame_set,
				  int lookup_quanta,
				  int lookup_tables,
				  int u64_per_lookup,
				  int tabsize,
				 uint64_t translation_tables[][tabsize]);

int bert_accelerated_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				  int start_addr, int data_length, struct frame_set *the_frame_set,
				  int lookup_quanta,
				  int lookup_tables,
				  int u64_per_lookup,
				  int tabsize,
				  uint64_t translation_tables[][tabsize]);

int logical_memory_slot(char *mname,int total_names);
