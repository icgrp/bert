#include <stdlib.h>
#include <stdint.h>
#include "7series.h"
#include "ultrascale_plus.h"
#include "compressed_bert_types.h"

#ifdef XILINX_SERIES7
#define WORDS_PER_FRAME=SERIES7_WORDS_PER_FRAME
#define WE_BITS_PER_FRAME=SERIES7_WE_BITS_PER_FRAME
  int bram18_starts[SERIES7_BRAM18_STARTS_PER_FRAME]=SERIES7_BRAM18_STARTS;
#endif

#ifdef XILINX_ULTRASCALE
#define WORDS_PER_FRAME=ULTRASCALE_WORDS_PER_FRAME
#define WE_BITS_PER_FRAME=ULTRASCALE_WE_BITS_PER_FRAME
  int bram18_starts[ULTRASCALE_BRAM18_STARTS_PER_FRAME+1]=ULTRASCALE_BRAM18_STARTS;
#endif

#undef DEBUG
#undef VERBOSE

#define MAX_BITS_IN_FRAME (WORDS_PER_FRAME*32)

int max(int a, int b)
{
  if (a>b)
    return(a);
  else
    return(b);
}
int min(int a, int b)
{
  if (a>b)
    return(b);
  else
    return(a);
}



// which bram is this within the frame?
int offset_range(int bitloc)
{
  
  for (int i=0;i<(WE_BITS_PER_FRAME*2);i++) // *2 for ramb18's
    {
#ifdef DEBUG_OFFSET_RANGE
      fprintf(stderr,"\tnow checking %d\n",i);
      fprintf(stderr,"\t&bram18_starts=0x%x\n",i,&bram18_starts);
      fprintf(stderr,"\t&bram18_starts[%d]=0x%x\n",i,&(bram18_starts[i]));
      fprintf(stderr,"\t&bram18_starts[%d]=0x%x\n",i+1,&(bram18_starts[i+1]));
      fprintf(stderr,"\t\tbram18_starts[%d]=%d\n",i,bram18_starts[i]);
#endif	
      if ((bram18_starts[i]<=bitloc) && (bram18_starts[i+1]>bitloc))
#ifdef DEBUG_OFFSET_RANGE
	fprintf(stderr,"Offset range %d gives %d\n",bitloc,i);
#endif	
	return(i);
    }
  fprintf(stderr,"offset_range called with bitloc=%d not in frame bits\n",
	  bitloc);
  exit(4);
}


int has_live_ramb18_partner(int which_logical_memory,
			    int first_frame_addr,
			    int len,
			    int we_bits,
			    struct compressed_logical_memory *clm)
{

  for (int i=0;i<NUM_LOGICAL;i++)
    if (i==which_logical_memory)
      {
	// skip self
      }
    else
      {
	for (int j=0;j<clm[i].nframe_ranges;j++)
	  {

	    // target range overlaps start of some other memory
	    //   or some other memory's range overlaps target
	    if (((first_frame_addr<=clm[i].frame_ranges[j].first_frame)
		&& ((first_frame_addr+len)>=clm[i].frame_ranges[j].first_frame))
		 ||
		 ((clm[i].frame_ranges[j].first_frame<=first_frame_addr)
		  && ((clm[i].frame_ranges[j].first_frame+clm[i].frame_ranges[j].len)>=first_frame_addr))
		)
	      for (int k=0;k<WE_BITS_PER_FRAME;k++)
		{
		  // are these two a ramb18 pair?
		  if (((((clm[i].frame_ranges[j].we_bits>>(2*k+1)) & 0x01)==1)
		      && (((we_bits>>(2*k))& 0x01)==1))
		      ||
		      ((((clm[i].frame_ranges[j].we_bits>>(2*k)) & 0x01)==1)
		       && (((we_bits>>(2*k+1))& 0x01)==1)))
		    return(1);
		}
	  }
      }
  return(0);
}

int numFrames(int which_replica,int replicas, int width, int current_slot,
	      struct bit_loc *bit_locations)
{
#ifdef DEBUG
  fprintf(stderr,"DEBUG: numFrames which_replica=%d\n",which_replica); // DEBUG
#endif  
  int frames=1;
  int last_frame=bit_locations[current_slot*width*replicas+which_replica].frame;
#ifdef DEBUG
  fprintf(stderr,"SERIOUS DEBUG: %llx ",last_frame); // DEBUG
#endif  
  for (int i=1;i<width;i++) {
    if (bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame!=last_frame)
      {
	last_frame=bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame;
#ifdef DEBUG
	fprintf(stderr," %llx ",last_frame); //DEBUG
#endif  
	frames++; 
      }
  }
#ifdef DEBUG
  fprintf(stderr,"DEBUG: %d frames\n",frames);
#endif  
  return(frames);
}

void bitSequenceLengths(int *bits_per_frame, int which_replica, int replicas,int width,
			int current_slot,  struct bit_loc *bit_locations) {
#ifdef DEBUG
  fprintf(stderr,"DEBUG: bitSequenceLengths which_replica=%d\n",which_replica); // DEBUG
#endif  
  int frames=1;
  int last_frame=bit_locations[current_slot*width*replicas+which_replica].frame;
  int bits=1;
  for (int i=1;i<width;i++) {
    if (bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame!=last_frame)
      {
	last_frame=bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame;
	bits_per_frame[frames-1]=bits;
	frames++;
	bits=1;
      }
    else
      {
	bits++;
      }
  }
  bits_per_frame[frames-1]=bits;

#ifdef DEBUG
  fprintf(stderr,"DEBUG: bits per frame:");
  for(int i=0;i<frames;i++)
    fprintf(stderr,"%d ",bits_per_frame[i]);
  fprintf(stderr,"\n");
#endif  

  return;
  
}
void sequenceLengths(int num_frames, int *sequence_lengths,int *bits_per_frame, int which_replica, int replicas,
		     int width, int total_slots, int current_slot,  struct bit_loc *bit_locations) {

#ifdef DEBUG
  fprintf(stderr,"DEBUG: sequenceLengths which_replica=%d\n",which_replica); // DEBUG
#endif  

  int current_bit=0;
  for(int i=0;i<num_frames; i++)
    {
      sequence_lengths[i]=-1;
      int j;
      for (j=1; ((j<=(WORDS_PER_FRAME*32)) && ((current_slot*width*replicas+j*width*replicas+current_bit*replicas+which_replica)<width*total_slots*replicas)) ; j++)
	if (bit_locations[current_slot*width*replicas+current_bit*replicas+which_replica].bit_loc==
	    bit_locations[current_slot*width*replicas+j*width*replicas+current_bit*replicas+which_replica].bit_loc)
	  {
	    sequence_lengths[i]=j;
	    for (int k=0;k<bits_per_frame[i];k++)
	      if (bit_locations[current_slot*width*replicas+current_bit*replicas+which_replica].bit_loc!=
		  bit_locations[current_slot*width*replicas+j*width*replicas+current_bit*replicas+which_replica].bit_loc)
		fprintf(stderr,"Warning: frame %d bit %d does not match at length %d but bit 0 did\n",
			i,k,j);
	      
	    break;
	  }
      if (sequence_lengths[i]<0)
	{
	  sequence_lengths[i]=j;
	  fprintf(stderr,"Warning: did not find sequence repeat up to %d for frame %d\n",j,i);
	}
      current_bit+=bits_per_frame[i];
    }

  // DEBUG
#ifdef DEBUG
  fprintf(stderr,"\tDEBUG: sequence lengths:");
  for(int i=0;i<num_frames; i++) fprintf(stderr,"%d ",sequence_lengths[i]);
  fprintf(stderr,"\n");
#endif  
  
}
void fillFrames(struct frame_sequence *sequence, int which_replica, int replicas,
		     int width, int current_slot,  struct bit_loc *bit_locations) {

#ifdef DEBUG
  fprintf(stderr,"DEBUG: fillFrames which_replica=%d\n",which_replica); // DEBUG
#endif  

  int last_frame=bit_locations[current_slot*width*replicas+which_replica].frame;
  sequence[0].frame_address=last_frame;
  int frames=1;
  for (int i=1;i<width;i++) {
    if (bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame!=last_frame)
      {
	last_frame=bit_locations[current_slot*width*replicas+i*replicas+which_replica].frame;
	sequence[frames].frame_address=last_frame;
	frames++;
      }
  }

}
void fillBits(int num_frames, struct frame_sequence *sequence, int which_replica, int replicas,
		     int width, int current_slot,  struct bit_loc *bit_locations) {

#ifdef DEBUG
  fprintf(stderr,"fillBits which_replica=%d replicas=%d width=%d\n",
	  which_replica,replicas,width); // DEBUG
#endif  
  
  int current_bit=0;
  for(int i=0;i<num_frames;i++)
    {
      for (int j=0;j<sequence[i].sequence_length;j++) {
	sequence[i].frame_bits[j].bit_loc=(int16_t *)malloc(sizeof(int16_t)*sequence[i].frame_bits[j].num_bits);
#ifdef DEBUG
	fprintf(stderr,"DEBUG: allocating bit_loc of length %d for replica %d frame %d seq %d\n",
		sequence[i].frame_bits[j].num_bits,
		which_replica,i,j); // DEBUG
#endif	
	for (int k=0;k<sequence[i].frame_bits[j].num_bits;k++) {
	  sequence[i].frame_bits[j].bit_loc[k]=
	    bit_locations[current_slot*width*replicas+j*width*replicas+(current_bit+k)*replicas+which_replica].bit_loc;
	}
      }
      current_bit+=sequence[i].frame_bits[0].num_bits;
    }
  
}
int countRepeats(struct frame_sequence *sequence, int which_replica, int replicas,
		 int width, int total_slots, int current_slot,  struct bit_loc *bit_locations) {

#ifdef DEBUG
  fprintf(stderr,"DEBUG: countRepeats which_replica=%d\n",which_replica); // DEBUG
#endif  

  int repeats=1;
  int sequence_length=sequence[0].sequence_length;
#ifdef DEBUG
  fprintf(stderr,"\tsequence[0].sequence_length=%d\n",sequence_length); // DEBUG
#endif  
  if (sequence_length==0)
    {
      fprintf(stderr,"countRepeats inconsistency: sequence_length=0\n");
      exit(3);
    }

  
  for(;((repeats+1)*sequence_length*width*replicas+current_slot)<=(width*total_slots*replicas);repeats++)
    {
      int next_repeat_match=1;
      for (int j=0;j<sequence_length;j++) {
	for (int k=0;k<sequence[0].frame_bits[j].num_bits;k++) {
	  if (bit_locations[current_slot*width*replicas+j*width*replicas+k*replicas+which_replica].bit_loc!=bit_locations[current_slot*width*replicas+repeats*sequence_length*width*replicas+j*width*replicas+k*replicas+which_replica].bit_loc)
	    next_repeat_match=0;
	  // added 1/16/2021
	  if ((bit_locations[current_slot*width*replicas+repeats*sequence_length*width*replicas+j*width*replicas+k*replicas+which_replica].frame-bit_locations[current_slot*width*replicas+j*width*replicas+k*replicas+which_replica].frame)>=FRAMES_PER_BRAM)
	    next_repeat_match=0;
	  
#ifdef DEBUG_COUNT_REPEATS
	  fprintf(stderr,"DEBUG: repeat %d %d (%x) %d (%x)\n",
		 repeats,
		 bit_locations[current_slot*width*replicas // a
			       +j*width*replicas+k*replicas+which_replica].bit_loc,
		 bit_locations[current_slot*width*replicas
			       +j*width*replicas+k*replicas+which_replica].frame,
		 bit_locations[current_slot*width*replicas // match a
			       +repeats*sequence_length*width*replicas // skip forward repeat
			       +j*width*replicas+k*replicas+which_replica].bit_loc, // match b
		 bit_locations[current_slot*width*replicas // match a
			       +repeats*sequence_length*width*replicas // skip forward repeat
			       +j*width*replicas+k*replicas+which_replica].frame);
#endif	  

	}
	if (next_repeat_match==0)
	  {
#ifdef DEBUG
	    fprintf(stderr,"DEBUG: countRepeats (not last segment) repeats=%d\n",repeats);
#endif  
	    return(repeats);
	  }
      }
    }
#ifdef DEBUG
  fprintf(stderr,"DEBUG: repeats=%d\n",repeats);
#endif  
  return(repeats);
  
}
int countSlots(struct frame_sequence *sequence, int which_replica, int replicas,
		     int width, int current_slot,  struct bit_loc *bit_locations) {

#ifdef DEBUG
  fprintf(stderr,"DEBUG: countSlots which_replica=%d\n",which_replica); // DEBUG
#endif  
  
  // since treating first frame in repeat as defining a repeat
  int sequence_length=sequence[0].sequence_length;
  return(sequence_length);
  
}

int uniqueFrames(int total_frames,int *unique_frames,struct frame_sequence *sequence)
{
  // find first that is an actual frame.
  int first=-1;
  for (int i=0;i<total_frames;i++)
    if (sequence[i].frame_address>0)
      {
	first=i;
	break;
      }

  if (first<0)
    return(0);
  
  int res=1;
  unique_frames[0]=sequence[first].frame_address;
  for (int i=first+1;i<total_frames;i++) {
    if (sequence[i].frame_address>0) {
      int duplicate=0;
      for (int j=0;j<res;j++)
	if (sequence[i].frame_address==unique_frames[j])
	  {
	    duplicate=1;
	  }
      if (duplicate==0) 
	{
	  unique_frames[res]=sequence[i].frame_address;
#ifdef DEBUG	  
	  fprintf(stderr,"DEBUG: adding unique frame %d = %x\n",res,sequence[i].frame_address);
#endif	  
	  res++;
	}
    }
    else // <0
      {
	// skip non-frames
      }
  }
  return(res);  
}

void compress_segment(int which, int replica, struct compressed_logical_memory *clm,
		      struct bit_loc *bit_locations)
{

#ifdef DEBUG
  fprintf(stderr,"DEBUG: compress_segment called with clm=%llx (len=%lx) clm->num_segments=%llx\n",
	  (uint64_t)clm,sizeof(struct compressed_logical_memory),
	  (uint64_t)(clm->num_segments));
#endif	  
  
  int total_slots=clm->words;
  int current_slot=0;
  int allocated_segments=4;
  struct segment_repeats *tmp_segments=(struct segment_repeats *)malloc(sizeof(struct segment_repeats)*allocated_segments);
  int segments=0;

#ifdef DEBUG
  fprintf(stderr,"DEBUG: compress_segment allocating tmp_segments=%llx (len=%lx)\n",
	  (uint64_t)tmp_segments,sizeof(struct segment_repeats)*allocated_segments);
#endif	  
  
  while (current_slot<total_slots)
    {
#ifdef DEBUG
      fprintf(stderr,"DEBUG: compress_segment which=%d current_slot=%d\n",
	      which,current_slot); // DEBUG
#endif	  
      int num_frames=numFrames(replica,clm->replicas,clm->wordlen,current_slot,bit_locations);
      int *bits_per_frame=(int *)malloc(sizeof(int)*num_frames);
      bitSequenceLengths(bits_per_frame,replica,clm->replicas,clm->wordlen,current_slot,bit_locations);
      int *sequence_lengths=(int *)malloc(sizeof(int)*num_frames);
      sequenceLengths(num_frames,sequence_lengths,bits_per_frame,
		      replica,clm->replicas,clm->wordlen,clm->words,current_slot,bit_locations);
      // create structures
      struct frame_sequence *next_sequence=(struct frame_sequence *)malloc(sizeof(struct frame_sequence)*num_frames); 
      fillFrames(next_sequence,replica,clm->replicas,clm->wordlen,current_slot,bit_locations);
      for (int i=0;i<num_frames;i++)
	{
	  next_sequence[i].sequence_length=sequence_lengths[i];
	  next_sequence[i].frame_bits=(struct frame_bits *)malloc(sizeof(struct frame_bits)*sequence_lengths[i]);
	  for (int j=0;j<sequence_lengths[i];j++)
	    next_sequence[i].frame_bits[j].num_bits=bits_per_frame[i];
	}
      fillBits(num_frames,next_sequence,replica,clm->replicas,clm->wordlen,current_slot,bit_locations);
      // find next segment break
      tmp_segments[segments].num_repeats=countRepeats(next_sequence,replica,clm->replicas,clm->wordlen,clm->words,current_slot,bit_locations);
      tmp_segments[segments].slots_in_repeat=countSlots(next_sequence,replica,clm->replicas,clm->wordlen,current_slot,bit_locations);
      tmp_segments[segments].bits_in_repeat=tmp_segments[segments].slots_in_repeat*clm->wordlen;
#ifdef DEBUG
      fprintf(stderr,"DEBUG: segment=%d bits_in_repeat=%d\n",segments,tmp_segments[segments].bits_in_repeat);
#endif
      tmp_segments[segments].frame_seq=next_sequence;
      tmp_segments[segments].num_frames=num_frames;
      tmp_segments[segments].unique_frames=(int *)malloc(sizeof(int)*num_frames);
      tmp_segments[segments].unique_frames_in_repeat=uniqueFrames(num_frames,
								  tmp_segments[segments].unique_frames,
								  next_sequence);
      current_slot+=tmp_segments[segments].num_repeats*tmp_segments[segments].slots_in_repeat;
      segments++;
      if (segments==allocated_segments)
	{
#ifdef DEBUG	  
	  fprintf(stderr,"DEBUG: allocating more segments from %d\n",allocated_segments);
#endif	  
	  int new_allocated_segments=2*allocated_segments;
	  struct segment_repeats *new_tmp_segments=(struct segment_repeats *)malloc(sizeof(struct segment_repeats)*new_allocated_segments);
	  for (int j=0;j<allocated_segments;j++) {
	    new_tmp_segments[j].num_repeats=tmp_segments[j].num_repeats;
	    new_tmp_segments[j].num_frames=tmp_segments[j].num_frames;
	    new_tmp_segments[j].bits_in_repeat=tmp_segments[j].bits_in_repeat;
	    new_tmp_segments[j].slots_in_repeat=tmp_segments[j].slots_in_repeat;
	    new_tmp_segments[j].frame_seq=tmp_segments[j].frame_seq;
	    new_tmp_segments[j].unique_frames=tmp_segments[j].unique_frames;
	    new_tmp_segments[j].unique_frames_in_repeat=tmp_segments[j].unique_frames_in_repeat;
	  }
	  allocated_segments=new_allocated_segments;
	  struct segment_repeats *old_tmp_segments=tmp_segments;
	  tmp_segments=new_tmp_segments;
	  free(old_tmp_segments);
	}
    }

#ifdef DEBUG
  fprintf(stderr,"DEBUG: mem=%d segments=%d\n",which,segments);
#endif	  
  clm->num_segments[replica]=segments;
  clm->repeats[replica]=tmp_segments;
}

int sumReplicaSegmentFrameRanges(struct compressed_logical_memory *clm)
{
  // doesn't union so may overcount
  //   point is to get an upper-bound for allocation to use in next function
  // (max_ranges)
  int result=0;
  for(int r=0;r<clm->replicas;r++)
    for (int i=0;i<clm->num_segments[r];i++) 
      result+=clm->repeats[r][i].unique_frames_in_repeat;
  return(result);
}

int whichRange(int frame, int ranges, struct compressed_frame_range *frame_ranges)
{
  // zero out bits in the FRAMES_PER_BRAM
  //  does depend on it being a power of 2
  int offset=(FRAMES_PER_BRAM-1) & frame;
  int base=frame^offset;

  for (int i=0;i<ranges;i++)
    {
    int frames_seen_offset=(FRAMES_PER_BRAM-1) & frame_ranges[i].first_frame;
    int frames_seen_base=frame_ranges[i].first_frame^frames_seen_offset;
    if (frames_seen_base==base)
      return(i);
    }
  return(-1);
}

int computeFrameRanges(int max_ranges, struct compressed_logical_memory *clm,
		       struct bit_loc *bit_locations)
{

#ifdef DEBUG
  fprintf(stderr,"DEBUG: computeFrameRanges\n");
#endif	  

  int ranges=0;
  struct compressed_frame_range *tmp_ranges=(struct compressed_frame_range *)malloc(sizeof(struct compressed_frame_range)*max_ranges);
  int total_bits=clm->words*clm->wordlen*clm->replicas;
  // iterate over every bit_location
  for (int i=0;i<total_bits; i++)
    {
      int frame=bit_locations[i].frame;
      if ((frame>=0) && (bit_locations[i].bit_loc>>0)) // skip non-existent bits
	{
	  int match=whichRange(frame,ranges,tmp_ranges);
	  //fprintf(stderr,"DEBUG: computeFrameRanges %d (totalbits %d) match=%d for frame=0x%x\n",
	  //      i,total_bits,match,frame);
	  if (match>-1)
	    {
	      if (frame<tmp_ranges[match].first_frame)
		{
		  tmp_ranges[match].len=tmp_ranges[match].len+(tmp_ranges[match].first_frame-frame);
		  tmp_ranges[match].first_frame=frame;
		}
	      else
		if ((tmp_ranges[match].first_frame+tmp_ranges[match].len-1)<frame)
		  tmp_ranges[match].len=frame-tmp_ranges[match].first_frame+1;
	      // all match cases
	      tmp_ranges[match].we_bits|=(1<<offset_range(bit_locations[i].bit_loc));
	    }
	  else
	    {
	      if (ranges>=max_ranges)
		{
		  fprintf(stderr,"computeFrameRanges: found more ranges than estimated max %d\n",
			  max_ranges);
		  exit(4);
		}
	      
	      tmp_ranges[ranges].first_frame=frame;
	      tmp_ranges[ranges].len=1;
	      tmp_ranges[ranges].we_bits=(1<<offset_range(bit_locations[i].bit_loc));
	      ranges++;
	    }
	} // processing valid (0 or greater) frame and bit
    }
  // install final ranges
#ifdef DEBUG
  fprintf(stderr,"DEBUG: computeFrameRanges installing frame ranges\n");
#endif	  
  clm->frame_ranges=tmp_ranges;
#ifdef DEBUG
  fprintf(stderr,"DEBUG: returning from computeFrameRanges\n");
#endif	  
  
  return(ranges);
}

void compress_logical_memory(int which, struct compressed_logical_memory *clm)
{
  clm->words=logical_memories[which].words;
  clm->wordlen=logical_memories[which].wordlen;
  clm->replicas=logical_memories[which].replicas;
  clm->num_segments=(int *)malloc(sizeof(int)*clm->replicas);
  clm->repeats=(struct segment_repeats **)malloc(sizeof(struct segment_repeats *)*clm->replicas);

  for(int r=0;r<clm->replicas;r++)
    compress_segment(which,r,clm,logical_memories[which].bit_locations);

#ifdef DEBUG
  fprintf(stderr,"DEBUG: clm which=%d num_segments[0]=%d\n",which,
	  clm->num_segments[0]);
#endif	  


  int max_frame_ranges=sumReplicaSegmentFrameRanges(clm);
  //  get set of frame ranges from data collected in segment_repeats
  // we_bits is part of this
  clm->nframe_ranges=computeFrameRanges(max_frame_ranges,clm,logical_memories[which].bit_locations);

  
}

void print_logical_memory_num_segments(int which, struct compressed_logical_memory *clm)
{
#ifdef DEBUG  
  fprintf(stderr,"DEBUG: plmns %d num_segments[0]=%d clm=%llx\n",which,clm->num_segments[0],
	  (uint64_t)clm);
#endif  
  
  printf("int mem%dnum_segments[%d]={",which,clm->replicas);
  for (int r=0;r<clm->replicas;r++) {
    if (r!=0) printf(",");
    printf("%d",clm->num_segments[r]);
  }
  printf("};\n");
  
}
void print_logical_memory_frame_ranges(int which, struct compressed_logical_memory *clm)
{
  printf("struct compressed_frame_range mem%d_frame_ranges[%d]={",which,clm->nframe_ranges);
  for (int i=0;i<clm->nframe_ranges;i++) {
    if (i!=0) printf(",");
    printf("{0x%x, %d, 0x%x,%d}",
	   clm->frame_ranges[i].first_frame,
	   clm->frame_ranges[i].len,
	   clm->frame_ranges[i].we_bits,
	   clm->frame_ranges[i].has_live_ramb18_partner);
  }
  printf("};\n");
    
}
void print_logical_memory_repeats(int which, struct compressed_logical_memory *clm)
{

#ifdef DEBUG
  fprintf(stderr,"DEBUG: print_logical_memory_repeats %d (replicas=%d)\n",which,clm->replicas);
#endif	  
  
  for (int r=0;r<clm->replicas;r++) {
    //fprintf(stderr,"DEBUG: plmr r=%d num_segments=%d\n",r,clm->num_segments[r]);
    for (int i=0;i<clm->num_segments[r];i++) {
      //fprintf(stderr,"DEBUG: plmr r=%d i=%d\n",r,i);
      for(int j=0;j<clm->repeats[r][i].num_frames;j++) {
	//fprintf(stderr,"DEBUG: plmr r=%d i=%d j=%d\n",r,i,j);
	for(int k=0;k<clm->repeats[r][i].frame_seq[j].sequence_length;k++) {
	  //fprintf(stderr,"DEBUG: plmr r=%d i=%d j=%d k=%d\n",r,i,j,k);
	  printf("int16_t mem%dreplica%dseg%dframe_bits%dbit_loc%d[%d]={",
		 which,r,i,j,k,clm->repeats[r][i].frame_seq[j].frame_bits[k].num_bits);
	  //fflush(stdout); // DEBUG
	  for(int l=0;l<clm->repeats[r][i].frame_seq[j].frame_bits[k].num_bits;l++) {
	    if (l!=0) printf(",");
	    printf("%d",clm->repeats[r][i].frame_seq[j].frame_bits[k].bit_loc[l]);
	  }
	  //fflush(stdout); // DEBUG
	  printf("};\n");
	  //fflush(stdout); // DEBUG
	}
      }
    }
  }

  fflush(stdout); // DEBUG
#ifdef DEBUG
  fprintf(stderr,"DEBUG: finished priniting bits\n"); // DEBUG
#endif	  

  
  for (int r=0;r<clm->replicas;r++) 
    for (int i=0;i<clm->num_segments[r];i++) 
      for(int j=0;j<clm->repeats[r][i].num_frames;j++)
	{
	  printf("struct frame_bits mem%dreplica%dseg%dframe_bits%d[%d]={",
		 which,r,i,j,clm->repeats[r][i].frame_seq[j].sequence_length);
	  for(int k=0;k<clm->repeats[r][i].frame_seq[j].sequence_length;k++) {
	    if (k!=0) printf(",");
	    printf("{%d,mem%dreplica%dseg%dframe_bits%dbit_loc%d}",
		   clm->repeats[r][i].frame_seq[j].frame_bits[k].num_bits,
		   which,r,i,j,k);
	  }
	  printf("};\n");
	}
      
  fflush(stdout); // DEBUG
	
  for (int r=0;r<clm->replicas;r++) {
    for (int i=0;i<clm->num_segments[r];i++) {
      printf("struct frame_sequence mem%dreplica%dseg%dframe_sequence[%d]={",
	     which,r,i,clm->repeats[r][i].num_frames);
      for(int j=0;j<clm->repeats[r][i].num_frames;j++)
	{
	  if (j!=0) printf(",");
	  printf("{0x%x,%d,mem%dreplica%dseg%dframe_bits%d}",
		 clm->repeats[r][i].frame_seq[j].frame_address,
		 clm->repeats[r][i].frame_seq[j].sequence_length,
		 which,r,i,j);
	}
      printf("};\n");
    }
  }
  
  fflush(stdout); // DEBUG
  
  for (int r=0;r<clm->replicas;r++) {
    for (int i=0;i<clm->num_segments[r];i++) {
      printf("int mem%dreplica%dseg%dunique_frames[%d]={",
	     which,r,i,clm->repeats[r][i].unique_frames_in_repeat);
      for(int j=0;j<clm->repeats[r][i].unique_frames_in_repeat;j++)
	{
	  if (j!=0) printf(",");
	  printf("0x%x",clm->repeats[r][i].unique_frames[j]);
	}
      printf("};\n");
    }
  }
	     
  fflush(stdout); // DEBUG

  for (int r=0;r<clm->replicas;r++) {
    printf("struct segment_repeats mem%dreplica%drepeats[%d]={",
	   which,r,clm->num_segments[r]);
    for (int i=0;i<clm->num_segments[r];i++)
      {
	if (i!=0) printf(",");
	printf("{%d,%d,%d,%d,%d,mem%dreplica%dseg%dframe_sequence,mem%dreplica%dseg%dunique_frames}\n",
	       clm->repeats[r][i].num_repeats,
	       clm->repeats[r][i].num_frames,
	       clm->repeats[r][i].bits_in_repeat,
	       clm->repeats[r][i].slots_in_repeat,
	       clm->repeats[r][i].unique_frames_in_repeat,
	       which,r,i,which,r,i
	       );

      }
    printf("};\n");
  }
    
    
  printf("struct segment_repeats *mem%drepeats[%d]={",which,clm->replicas);
  for(int r=0;r<clm->replicas;r++)
    {
	if (r!=0) printf(",");
	printf("mem%dreplica%drepeats",which,r);
    }
  printf("};\n");
  
}

void print_logical_memory(int which, struct compressed_logical_memory *clm)
{
  printf("\t{%d,%d,%d,%d,mem%dnum_segments,mem%d_frame_ranges,mem%drepeats}\n",
	 clm->nframe_ranges,clm->wordlen,clm->words,clm->replicas,
	 which,which,which);
}

int main ()
{
  
#ifdef VERBOSE  
  printf("//Design has %d logical memories\n", NUM_LOGICAL);
#endif
  printf("#include <stdio.h>\n");
  printf("#include <stdint.h>\n");
  printf("#include \"compressed_bert_types.h\"\n");
  printf("#define NUM_LOGICAL %d\n",NUM_LOGICAL);

  printf("int bert_compress_version=3; // non-uniform memory, ramb18 wes\n");


#ifdef XILINX_SERIES7
  printf("int words_per_frame=SERIES7_WORDS_PER_FRAME;\n");
  printf("int frames_per_bram=SERIES7_FRAMES_PER_BRAM;\n");
  printf("int words_between_frames=SERIES7_WORDS_BETWEEN_FRAMES;\n");
  printf("int words_after_frames=SERIES7_WORDS_AFTER_FRAMES;\n");
  printf("int words_before_frames=SERIES7_WORDS_BEFORE_FRAMES;\n");
  printf("int pad_words=SERIES7_PAD_WORDS;\n");
  printf("int we_bits_per_frame=SERIES7_WE_BITS_PER_FRAME;\n");
  printf("int bitlocations[SERIES7_WE_BITS_PER_FRAME]=SERIES7_BITLOCATIONS;\n");
  printf("int bram_starts[SERIES7_WE_BITS_PER_FRAME]=SERIES7_BRAM_STARTS;\n");
#endif

#ifdef XILINX_ULTRASCALE
  printf("int words_per_frame=ULTRASCALE_WORDS_PER_FRAME;\n");
  printf("int frames_per_bram=ULTRASCALE_FRAMES_PER_BRAM;\n");
  printf("int words_between_frames=ULTRASCALE_WORDS_BETWEEN_FRAMES;\n");
  printf("int words_after_frames=ULTRASCALE_WORDS_AFTER_FRAMES;\n");
  printf("int words_before_frames=ULTRASCALE_WORDS_BEFORE_FRAMES;\n");
  printf("int pad_words=ULTRASCALE_PAD_WORDS;\n");
  printf("int we_bits_per_frame=ULTRASCALE_WE_BITS_PER_FRAME;\n");
  printf("int bitlocations[ULTRASCALE_WE_BITS_PER_FRAME]=ULTRASCALE_BITLOCATIONS;\n");
  printf("int bram_starts[ULTRASCALE_WE_BITS_PER_FRAME+1]=ULTRASCALE_BRAM_STARTS;\n");
#endif

  
  // reprint names
  printf("const char *logical_names[] = {");
  for(int i=0;i<NUM_LOGICAL;i++) {
    if (i!=0) printf(",");
    printf("\"%s\"",logical_names[i]);
  }
  printf("};\n");

  int **all_memories_we_bits=(int **)malloc(sizeof(int *)*NUM_LOGICAL);

  struct compressed_logical_memory *clm=(struct compressed_logical_memory *)malloc(sizeof(struct compressed_logical_memory)*NUM_LOGICAL);
  for(int i=0;i<NUM_LOGICAL;i++) {
    printf("// Beginning of Logical Memory %d\n",i);
#ifdef VERBOSE    
      printf("//Logical memory %d has name %s with organization %d x %d\n",
	     i,logical_names[i],
	     logical_memories[i].words,
	     logical_memories[i].wordlen);
#endif

      compress_logical_memory(i,&clm[i]);
      
  }

  //  must do has_live_partner after have all memories defined
  //     so do a pass for that here...
  for(int i=0;i<NUM_LOGICAL;i++) 
    for (int j=0;j<clm[i].nframe_ranges;j++)
      clm[i].frame_ranges[j].has_live_ramb18_partner=
	has_live_ramb18_partner(i,
				clm[i].frame_ranges[j].first_frame,
				clm[i].frame_ranges[j].len,
				clm[i].frame_ranges[j].we_bits,
				clm);
  
#ifdef DEBUG
  fprintf(stderr,"DEBUG: beginning to print\n");
#endif	  
  
  // print stuff out
  for(int i=0;i<NUM_LOGICAL;i++) {
    print_logical_memory_num_segments(i,&clm[i]);
  }

#ifdef DEBUG
  fprintf(stderr,"DEBUG: finished memory segments\n");
#endif	  

  for(int i=0;i<NUM_LOGICAL;i++) {
    print_logical_memory_frame_ranges(i,&clm[i]);
  }

#ifdef DEBUG
  fprintf(stderr,"DEBUG: finished frame ranges\n");
#endif	  
  
  for(int i=0;i<NUM_LOGICAL;i++) {
    print_logical_memory_repeats(i,&clm[i]);
  }

#ifdef DEBUG
  fprintf(stderr,"DEBUG: finished repeats\n");
#endif	  
  
  printf("struct compressed_logical_memory  logical_memories[NUM_LOGICAL]={\n");
  for(int i=0;i<NUM_LOGICAL;i++) {
    if (i!=0) printf(",");
    print_logical_memory(i,&clm[i]);
  }
  printf("};\n");
  
}
