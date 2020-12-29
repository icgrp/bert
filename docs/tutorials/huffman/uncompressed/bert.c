#include "stdint.h"
#include "bert_types.h"
#include "ultrascale_plus.h"
#include "stdio.h"
#include "stdint.h"
#include "stdlib.h"
#include "readback.h"


#include "bert.h"


#ifdef TIME_BERT
#include "xtime_l.h"
XTime tstart, tend, cstart, cend;
XTime wstart;
XTime pend; // DEBUG
double time_us_read=-1;
double time_us_write=-1;
double time_us_logical=-1;
double time_us_physical=-1;
double time_us_transfuse=-1;
double bert_get_last_transfuse_time_us() {return(time_us_transfuse);}
double bert_get_last_read_time_us() {return(time_us_read);}
double bert_get_last_write_time_us() {return(time_us_write);}
double bert_get_last_logical_time_us() {return(time_us_logical);}
double bert_get_last_physical_time_us() {return(time_us_physical);}
#else
double bert_get_last_transfuse_time_us() {return(-1);}
double bert_get_last_read_time_us() {return(-1);}
double bert_get_last_write_time_us() {return(-1);}
double bert_get_last_logical_time_us() {return(-1);}
double bert_get_last_physical_time_us() {return(-1);}
#endif


#define min(x,y) ((x<y)?x:y)
#define max(x,y) ((x<y)?y:x)


// note: instead of linking against mydesign.h
extern const char * logical_names[];
extern struct logical_memory logical_memories[];


// Note: this differs from the version in the compress version
//  this doesn't just return the base, it also deals with the offset within
int find_offset(int frame, struct frame_set *the_frame_set)
{
  int num_ranges=the_frame_set->num_ranges;
  // if num_ranges > ?? maybe should do binary search
  //   ...would need to make sure they are in order to do that (not currently)
  for (int i=0;i<num_ranges;i++)
    {
      int frame_offset_from_base=frame-the_frame_set->ranges[i].frame_base;
      if ((the_frame_set->ranges[i].frame_base<=frame)
	  && (frame_offset_from_base<the_frame_set->ranges[i].len))
	{
#ifdef DEBUG_FIND_OFFSET	  
	  printf("find_offset translating %08x to %d\n",
		 frame,the_frame_set->ranges[i].offset+frame_offset_from_base*WORDS_PER_FRAME);
#endif	  
	  return(the_frame_set->ranges[i].offset+frame_offset_from_base*WORDS_PER_FRAME);
	}
    }

  fprintf(stderr,"ERROR: Frame %x not found in the_frame_set\n",frame);
  for (int i=0;i<num_ranges;i++)
    {
      fprintf(stderr,"\tRange base=%x len=%d\n",
	      the_frame_set->ranges[i].frame_base,
	      the_frame_set->ranges[i].len);
    }

  exit(1);
}

struct frame_set *bert_union(int num, struct bert_meminfo *info)
{

  int max_frame_ranges=0;
  for(int i=0;i<num;i++)
    max_frame_ranges+=logical_memories[info[i].logical_mem].nframe_ranges;

  int current_frame_ranges=0;

  struct frame_range_offset *ranges=(struct frame_range_offset *)malloc(sizeof(struct frame_range_offset)*max_frame_ranges);

  for (int rw=0;rw<2;rw++)
    {
      for (int i=0;i<num;i++)
	{
	  // process writes first so that they end up first in the frame set
	  if (((rw==0) & (info[i].operation==BERT_OPERATION_WRITE))
	      ||((rw==1) & (info[i].operation==BERT_OPERATION_READ)))
	    {

	      int mem_ranges=logical_memories[info[i].logical_mem].nframe_ranges;
	      for (int j=0;j<mem_ranges;j++)
		{
		  // TODO: can we narrow this range?
		  //    don't really have enough information here;
		  //    might have enough information in the compressed case,
		  //    but even there might be difficult.
		  //   Could do some pre-computation for this case and put that
		  //      information into the .c file.
		  //   Leave for a later optimization.
		  int frame_base=logical_memories[info[i].logical_mem].frame_ranges[j].first_frame;
		  int len=logical_memories[info[i].logical_mem].frame_ranges[j].len;
		  int found=0;
		  for (int k=0;k<current_frame_ranges;k++)
		    {
		      if ((ranges[k].frame_base<=frame_base) &&
			  ((ranges[k].frame_base+ranges[k].len) >= (frame_base+len))
			  )
			{
			  // this is already in list
			  found=1;
			  break;
			}
		      else if ((frame_base<=ranges[k].frame_base) &&
			       ((frame_base+len) >= (ranges[k].frame_base+ranges[k].len)))
			{
			  // this is larger, redefine entry
			  found=1;
			  ranges[k].frame_base=frame_base;
			  ranges[k].len=len;
			  break;
			}
		      else if (((frame_base<ranges[k].frame_base) &&
				((frame_base+len) <=(ranges[k].frame_base+ranges[k].len)))
			       ||
			       ((ranges[k].frame_base<frame_base) &&
				((ranges[k].frame_base+ranges[k].len) <=(frame_base+len)))
			       )
			{
			  // they intersect, neither subsumes
			  found=1;
			  int new_base=min(frame_base,ranges[k].frame_base);
			  // TODO: review this
			  int new_len=max(frame_base+len,ranges[k].frame_base+ranges[k].len)-new_base;
			  ranges[k].frame_base=new_base;
			  ranges[k].len=new_len;
			}
		    }
		  if (found==0)
		    {
		      if (rw==0) // writes
			  ranges[current_frame_ranges].has_write=1;
		      else
			  ranges[current_frame_ranges].has_write=0;
		      ranges[current_frame_ranges].frame_base=frame_base;
		      ranges[current_frame_ranges].len=len;
		      current_frame_ranges++;
		    }
		}
	    } // if read or write
	} // all memories
    } // rw
									
									
  struct frame_set *result=malloc(sizeof(struct frame_set));
  result->num_ranges=current_frame_ranges;
  result->ranges=ranges;
  return(result);
  

}


void bert_to_logical(int logical,uint32_t *frame_data,uint64_t *logical_data,
			       int start_addr, int data_length,
			       struct frame_set *the_frame_set)
{

  if (logical_memories[logical].nframe_ranges<1)
    return; // nothing to translate

  int wordlen=logical_memories[logical].wordlen;
  int b64_per_word=(wordlen+63)/64;
  int words=logical_memories[logical].words;
  words=min(words,start_addr+data_length);

  int current_frame=-1; // always fail on first try
  int frame_offset=-1;

  for (int loc=start_addr;loc<words;loc++)
    {
      for (int wrds=0;wrds<b64_per_word;wrds++)
	logical_data[(loc-start_addr)*b64_per_word+wrds]=0;
      for (int b=0;b<wordlen;b++)
	{
	  int frame=logical_memories[logical].bit_locations[loc*wordlen+b].frame;
	  if (frame!=current_frame)
	    {
	      frame_offset=find_offset(frame,the_frame_set);
	      current_frame=frame;
	    }

	  int frame_word=logical_memories[logical].bit_locations[loc*wordlen+b].bit_loc/32;
	  int bit_in_word=logical_memories[logical].bit_locations[loc*wordlen+b].bit_loc%32;
	  int bit_in_logical=b%64;
	  int word_logical=b/64;
	  if (((frame_data[frame_offset+frame_word]>>bit_in_word) & 0x01)==1)
	    
	    logical_data[(loc-start_addr)*b64_per_word+word_logical]|=((uint64_t) 1)<<bit_in_logical;
	  else
	    {
	      uint64_t bit_mask=
		(((uint64_t)(0xFFFFFFFF)) | (((uint64_t)(0xFFFFFFFF))<<32))
		-(((uint64_t)1)<<bit_in_logical);
	      logical_data[(loc-start_addr)*b64_per_word+word_logical]&=bit_mask;
	    }
	  
	  
	}
    }
}


void bert_to_physical(int logical,uint32_t *frame_data,uint64_t *logical_data,
				int start_addr, int data_length,struct frame_set *the_frame_set)
{

  if (logical_memories[logical].nframe_ranges<1)
    return; // nothing to translate


  int wordlen=logical_memories[logical].wordlen;
  int b64_per_word=(wordlen+63)/64;  
  int words=logical_memories[logical].words;
  words=min(words,start_addr+data_length);


  int current_frame=-1; // always fail on first try
  int frame_offset=-1;


  for (int loc=start_addr;loc<words;loc++)
    {
      for (int b=0;b<wordlen;b++)
	{
	  int frame=logical_memories[logical].bit_locations[loc*wordlen+b].frame;
	  if (frame!=current_frame)
	    {
	      frame_offset=find_offset(frame,the_frame_set);
	      current_frame=frame;
	    }
	  
	  int frame_word=logical_memories[logical].bit_locations[loc*wordlen+b].bit_loc/32;
	  int bit_in_word=logical_memories[logical].bit_locations[loc*wordlen+b].bit_loc%32;
	  int bit_in_logical=b%64;
	  int word_logical=b/64;
	  int bit=(logical_data[(loc-start_addr)*b64_per_word+word_logical]>>bit_in_logical) & 0x01;

	  uint32_t bit_mask=0xFFFFFFFF-(1<<bit_in_word);
	  if (bit==0)
	    frame_data[frame_offset+frame_word]=
	      frame_data[frame_offset+frame_word]&bit_mask;
	  else
	    frame_data[frame_offset+frame_word]=
	      frame_data[frame_offset+frame_word] | (1<<bit_in_word);

	}
    }


}

int  bert_read(int logicalm, uint64_t *data, XFpga* XFpgaInstance)
{
#ifdef TIME_BERT
	time_us_transfuse=-2; // for error exits
	XTime_GetTime(&tstart);
#endif

  s32 Status;

  int num_frame_ranges=logical_memories[logicalm].nframe_ranges;
    // allocate frame ranges data
  struct frame_range_offset *frame_range_offset_data=(struct frame_range_offset *)malloc(sizeof(struct frame_range_offset)*num_frame_ranges); 
  int offset=WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4;
  for (int i=0;i<num_frame_ranges;i++)
    {
      frame_range_offset_data[i].frame_base=logical_memories[logicalm].frame_ranges[i].first_frame;
      frame_range_offset_data[i].len=logical_memories[logicalm].frame_ranges[i].len;
      frame_range_offset_data[i].offset=offset;
      offset+=WORDS_PER_FRAME*frame_range_offset_data[i].len+WORDS_BETWEEN_FRAMES; 
    }
  struct frame_set the_frame_set;
  the_frame_set.num_ranges=num_frame_ranges;
  the_frame_set.ranges=frame_range_offset_data;
  offset+=WORDS_AFTER_FRAMES;

  // allocate frame data
  uint32_t *frame_data=(uint32_t *)malloc(sizeof(uint32_t)*offset);

#ifdef TIME_BERT
	time_us_read=-1;
	time_us_write=-1;
	time_us_logical=-1;
	time_us_physical=-1;
	XTime_GetTime(&cstart);
#endif

  // read back to front due to padding data that comes with readback
  for (int i=num_frame_ranges-1;i>-1;i--)
    {
      uint32_t WrdCnt = WORDS_PER_FRAME * (frame_range_offset_data[i].len + 1)
	+ PAD_WORDS;
      Status = XFpga_GetPlConfigData(XFpgaInstance,
				     (UINTPTR)&frame_data[frame_range_offset_data[i].offset-(WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4)],
				     WrdCnt,
				     frame_range_offset_data[i].frame_base);
      if (Status != XST_SUCCESS) {
	return XST_FAILURE;
      }
    }
#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_read=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
	XTime_GetTime(&cstart);
#endif

  //  uint32_t *pointer_from_readback=&frame_data[WORDS_PER_FRAME + PAD_WORDS + DATA_DMA_OFFSET/4];
  
  bert_to_logical(logicalm, frame_data, data, 0, logical_memories[logicalm].words, &the_frame_set);
#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_logical=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
	XTime_GetTime(&cstart);
#endif

  free(frame_data);
  free(frame_range_offset_data);
  

#ifdef TIME_BERT
  XTime_GetTime(&tend);
  time_us_transfuse = (double) ((tend - tstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

  return XST_SUCCESS;
  
}


int  bert_write(int logicalm, uint64_t *data, XFpga* XFpgaInstance)
{
  s32 Status;

#ifdef TIME_BERT
	time_us_transfuse=-2; // for error exits
	XTime_GetTime(&tstart);
#endif

  int num_frame_ranges=logical_memories[logicalm].nframe_ranges;
    // allocate frame ranges data
  struct frame_range_offset *frame_range_offset_data=(struct frame_range_offset *)malloc(sizeof(struct frame_range_offset)*num_frame_ranges); 
  int offset=WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4;
  for (int i=0;i<num_frame_ranges;i++)
    {
      frame_range_offset_data[i].frame_base=logical_memories[logicalm].frame_ranges[i].first_frame;
      frame_range_offset_data[i].len=logical_memories[logicalm].frame_ranges[i].len;
      frame_range_offset_data[i].offset=offset;
      offset+=WORDS_PER_FRAME*frame_range_offset_data[i].len+WORDS_BETWEEN_FRAMES; 
    }
  struct frame_set the_frame_set;
  the_frame_set.num_ranges=num_frame_ranges;
  the_frame_set.ranges=frame_range_offset_data;
  offset+=WORDS_AFTER_FRAMES;

  // allocate frame data
  uint32_t *frame_data=(uint32_t *)malloc(sizeof(uint32_t)*offset);

#ifdef TIME_BERT
	time_us_read=-1;
	time_us_write=-1;
	time_us_logical=-1;
	time_us_physical=-1;
	XTime_GetTime(&cstart);
#endif

  // read back to front due to padding data that comes with readback
  for (int i=num_frame_ranges-1;i>-1;i--)
    {
      uint32_t WrdCnt = WORDS_PER_FRAME * (frame_range_offset_data[i].len + 1)
	+ PAD_WORDS;
      Status = XFpga_GetPlConfigData(XFpgaInstance,
				     (UINTPTR)&frame_data[frame_range_offset_data[i].offset-(WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4)],
				     WrdCnt,
				     frame_range_offset_data[i].frame_base);
      if (Status != XST_SUCCESS) {
	return XST_FAILURE;
      }
    }
#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_read=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
	XTime_GetTime(&cstart);
#endif
    
  // 2: update with logical data provided
  bert_to_physical(logicalm,frame_data,data,0,logical_memories[logicalm].words,&the_frame_set);

#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_physical=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

  // write control data into slots left in frame data
  int len=0;
  for (int i = 0; i < num_frame_ranges; i++) {
    uint32_t* arr = &frame_data[frame_range_offset_data[i].offset - WORDS_BETWEEN_FRAMES];
    // Add ctrl commands
    arr[0] = 0x30002001; // COR 0
    arr[1] = frame_range_offset_data[i].frame_base;
    arr[2] = 0x30008001; // write CMD
    arr[3] = 0x00000001; //  WCFG
    arr[4] = 0x20000000;
    arr[5] = 0x30004000;
    int wrds = (frame_range_offset_data[i].len + 1) * WORDS_PER_FRAME;
    arr[6] = 0x50000000 | wrds;
    len += wrds + WORDS_BETWEEN_FRAMES;
    // Clear write mask bits
    for (int j = 0; j < frame_range_offset_data[i].len; j++) {
      arr = &frame_data[frame_range_offset_data[i].offset + j*WORDS_PER_FRAME];
      for (int k = 0; k < WE_BITS_PER_FRAME; k++) {
        int b = bitlocation[k];
        arr[b / 32] &= ~(1 << (31 - (b % 32)));
      }
    }
  }
  u32 Flags=XFPGA_PARTIAL_EN | XFPGA_ONLY_BIN_EN;
  
#ifdef TIME_BERT
	XTime_GetTime(&cstart);
#endif

  // 3: write back
  Status=XFpga_PL_Frames_Load(XFpgaInstance,(UINTPTR)frame_data,Flags,len);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }

#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_write=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

  // return memory allocated
  free(frame_data);
  free(frame_range_offset_data);
  
  return XST_SUCCESS;

#ifdef TIME_BERT
  XTime_GetTime(&tend);
  time_us_transfuse = (double) ((tend - tstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

}


int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga* XFpgaInstance)
{

#ifdef TIME_BERT
	time_us_transfuse=-2; // for error exits
	XTime_GetTime(&tstart);
#endif

  s32 Status;

  struct frame_set *the_frame_set=bert_union(num,meminfo);

  //gives a composite frame set, but still needs to calculate the offsets
  int offset=WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4;
  for (int i=0;i<the_frame_set->num_ranges;i++)
    {
      the_frame_set->ranges[i].offset=offset;
      offset+=WORDS_PER_FRAME*the_frame_set->ranges[i].len+WORDS_BETWEEN_FRAMES; 
    }
  offset+=WORDS_AFTER_FRAMES;

  // allocate frame data
  uint32_t *frame_data=(uint32_t *)malloc(sizeof(uint32_t)*offset);

#ifdef TIME_BERT
	time_us_read=-1;
	time_us_write=-1;
	time_us_logical=-1;
	time_us_physical=-1;
	XTime_GetTime(&cstart);
#endif

  // read back to front due to padding data that comes with readback
  for (int i=the_frame_set->num_ranges-1;i>-1;i--)
    {
      uint32_t WrdCnt = WORDS_PER_FRAME * (the_frame_set->ranges[i].len + 1)
	+ PAD_WORDS; // AMD to match above  + DATA_DMA_OFFSET/4;
      Status = XFpga_GetPlConfigData(XFpgaInstance,
				     (UINTPTR)&frame_data[the_frame_set->ranges[i].offset-(WORDS_PER_FRAME+PAD_WORDS+DATA_DMA_OFFSET/4)],
				     WrdCnt,
				     the_frame_set->ranges[i].frame_base);
      if (Status != XST_SUCCESS) {
	return XST_FAILURE;
      }
    }
#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_read=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
	XTime_GetTime(&cstart);
#endif
  //  uint32_t *pointer_from_readback=&frame_data[WORDS_PER_FRAME + PAD_WORDS + DATA_DMA_OFFSET/4];

  for (int i=0;i<num;i++)
    {
      if (meminfo[i].operation==BERT_OPERATION_READ)
	
	bert_to_logical(meminfo[i].logical_mem,
			frame_data,
			meminfo[i].data,
			meminfo[i].start_addr, meminfo[i].data_length,
			the_frame_set);
    }
#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_logical=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
	XTime_GetTime(&cstart);
#endif

  for (int i=0;i<num;i++)
    {
      if (meminfo[i].operation==BERT_OPERATION_WRITE)
	
	bert_to_physical(meminfo[i].logical_mem,
			 frame_data,
			 meminfo[i].data,
			 meminfo[i].start_addr, meminfo[i].data_length,
			 the_frame_set);
    }


#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_physical=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

    // write control data into slots left in frame data .... and find length of write data
  int len=0;
  for (int i = 0; i < the_frame_set->num_ranges; i++) {
      if (the_frame_set->ranges[i].has_write==0)
	break; // drop out when hit first read
      uint32_t* arr = &frame_data[the_frame_set->ranges[i].offset - WORDS_BETWEEN_FRAMES];
      // Add ctrl commands
      arr[0] = 0x30002001; // COR 0
      arr[1] = the_frame_set->ranges[i].frame_base;
      arr[2] = 0x30008001; // write CMD
      arr[3] = 0x00000001; //  WCFG
      arr[4] = 0x20000000;
      arr[5] = 0x30004000;
      int wrds = (the_frame_set->ranges[i].len + 1) * WORDS_PER_FRAME;
      arr[6] = 0x50000000 | wrds;
      len += wrds + WORDS_BETWEEN_FRAMES;
      // Clear write mask bits
      for (int j = 0; j < the_frame_set->ranges[i].len; j++) {
	arr = &frame_data[the_frame_set->ranges[i].offset + j*WORDS_PER_FRAME];
	for (int k = 0; k < WE_BITS_PER_FRAME; k++) {
	  int b = bitlocation[k];
	  arr[b / 32] &= ~(1 << (31 - (b % 32)));
	}
      }
  }
  u32 Flags=XFPGA_PARTIAL_EN | XFPGA_ONLY_BIN_EN;
  
#ifdef TIME_BERT
	XTime_GetTime(&cstart);
#endif

  // 3: write back
  Status=XFpga_PL_Frames_Load(XFpgaInstance,(UINTPTR)frame_data,Flags,len);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }

#ifdef TIME_BERT
	XTime_GetTime(&cend);
	time_us_write=(double) ((cend - cstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif

  

  free(frame_data);
  free(the_frame_set->ranges);
  free(the_frame_set);

#ifdef TIME_BERT
  XTime_GetTime(&tend);
  time_us_transfuse = (double) ((tend - tstart) * 1000000.0) / COUNTS_PER_SECOND;
#endif
  return XST_SUCCESS;
  
}

int logical_memory_slot(char *mname, int total_names)
{
		for(int i=0;i<total_names;i++) {
			if (strcmp(mname,logical_names[i])==0)
				return(i);
		}
		return(-1);
}

