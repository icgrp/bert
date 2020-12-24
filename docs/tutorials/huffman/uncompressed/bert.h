#include "xilfpga.h"
#define BERT_OPERATION_WRITE 1
#define BERT_OPERATION_READ 2

struct bert_meminfo {
  int logical_mem;
  int operation;
  uint64_t *data;
  int start_addr;
  int data_length;
};


int  bert_read(int logicalm, uint64_t *data, XFpga *XfpgaInstance);
int  bert_write(int logicalm, uint64_t *data, XFpga *XfpgaInstance);
int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance);


void bert_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
			       int start_addr, int data_length, struct frame_set *the_frame_set);

void bert_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				int start_addr, int data_length, struct frame_set *the_frame_set);


int logical_memory_slot(char *mname,int total_names);

// for grabbing timing when TIME_BERT_TRANFUSE or TIME_BERT_COMPONENTS are defined
double bert_get_last_transfuse_time_us();
double bert_get_last_read_time_us();
double bert_get_last_write_time_us();
double bert_get_last_logical_time_us();
double bert_get_last_physical_time_us();
