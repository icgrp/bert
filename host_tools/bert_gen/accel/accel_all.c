#include "ultrascale_plus.h"
#include <stdlib.h>
#include <string.h>

#define MAX_QUANTA 11
#define MIN_QUANTA 4

#define min(x,y) ((x<y)?x:y)
#define max(x,y) ((x<y)?y:x)

#undef VERBOSE
#undef DEBUG_LOGICAL
#undef CLEAR_TABLE_ON_ALLOC

const char *logical_physical_upper[] ={"PHYSICAL","LOGICAL"};
const char *logical_physical_lower[] ={"physical","logical"};

int count_bits(uint64_t v)
{
  int res=0;
  for (int i=0;i<64;i++)
    if (((v>>i) & 0x01)==1)
      res++;
  return(res);
}
int base(int num_seq, int num_bits, struct frame_bits *all_bits)
{
  return(all_bits[0].bit_loc[0]);
  // maybe check makes sense for a RAMB36 or RAMB18
  
}

int bram_bits_in_frame(int num_seq, int num_bits, struct frame_bits *all_bits)
{
  int bit0=all_bits[0].bit_loc[0];
  int bit1;
  if (num_bits>1)
    bit1=all_bits[0].bit_loc[1];
  else
    bit1=all_bits[1].bit_loc[0];
  if (bit1-bit0==12)
    return(120); // RAMB18 case
  else if (bit1-bit0==132)
    return(240); // RAMB36 case
  else
    {
      fprintf(stderr,"Unexpected bit 0 to bit 1 separation %d from 0 at %d and 1 at %d\n",
	      bit1-bit0,bit1,bit0);
      exit(10);
      
    }
}

int max_frame_bit(int num_seq, int num_bits, struct frame_bits *all_bits)
{
  int offset=all_bits[0].bit_loc[0];
  int maxbit=offset;
  for (int i=0;i<num_seq;i++)
    for (int j=0;j<num_bits;j++)
    maxbit=max(maxbit,all_bits[i].bit_loc[j]);
  return(maxbit-offset);
  
}

int word_offset_from_frame_bitpos(int wordlen, int seqpos, int bitpos,
				  int frame_bit_offset,
				  int num_seq, int num_bits,
				  struct frame_bits *all_bits)
{
  int bram_base=base(num_seq,num_bits,all_bits);
  for (int i=0;i<num_seq;i++)
    for (int j=0;j<num_bits;j++)
      //if (all_bits[i].bit_loc[j]==bitpos+bram_base)
    if (all_bits[i].bit_loc[j]==(seqpos*num_bits+bitpos)+bram_base)
      return((i*num_bits+j)/wordlen);
  return(-1);
}



int bit_offset_from_frame_bitpos(int wordlen, int seqpos, int bitpos,
				  int frame_bit_offset,
				  int num_seq, int num_bits,
				  struct frame_bits *all_bits)
{
  int bram_base=base(num_seq,num_bits,all_bits);
  for (int i=0;i<num_seq;i++)
    for (int j=0;j<num_bits;j++)
      //    if (all_bits[i].bit_loc[j]==bitpos+bram_base)
      if (all_bits[i].bit_loc[j]==(seqpos*num_bits+bitpos)+bram_base)
	return((i*num_bits+j)%wordlen);
  return(-1);
}

int quanta(int length)
{
  for (int i=MAX_QUANTA;i>=MIN_QUANTA;i--)
    if (length%i==0)
      return(i);
  return(-1);
}

void noaccel_memory(int which, int logical, FILE *cfp)
{
  const char *logical_physical=logical_physical_upper[logical];
  // stuff that indicates memory has no accelerator tables
  fprintf(cfp,"#define ACCEL_LOOKUP_QUANTA_MEM_%s_%d %d\n",logical_physical,which,-1);
  fprintf(cfp,"#define ACCEL_FRAME_BIT_OFFSET_%s_%d %d\n",logical_physical,which,0);
  fprintf(cfp,"#define ACCEL_LOOKUP_TABLES_%s_%d %d\n",logical_physical,which,0);
  fprintf(cfp,"#define ACCEL_U64_PER_LOOKUP_%s_%d %d\n",logical_physical,which,0);
  fprintf(cfp,"#define ACCEL_BIT_LOW_%s_%d %d\n",logical_physical,which,0);
  fprintf(cfp,"#define ACCEL_BIT_HIGH_%s_%d %d\n",logical_physical,which,0);

  fprintf(cfp,"#define ACCEL_MEM_%s%d {",logical_physical,which);
  fprintf(cfp,"ACCEL_LOOKUP_TABLES_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_U64_PER_LOOKUP_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_LOOKUP_QUANTA_MEM_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_FRAME_BIT_OFFSET_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_BIT_LOW_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_BIT_HIGH_%s_%d,",logical_physical,which);
  fprintf(cfp,"(uint64_t **)NULL}\n");


}
void process_memory(int which, int lookup_quanta, int logical, FILE *cfp)
{

  const char *logical_physical=logical_physical_upper[logical];
  
  int words=logical_memories[which].words;
  int wordlen=logical_memories[which].wordlen;
  int bits_in_repeat=logical_memories[which].repeats[0][0].bits_in_repeat;
  int slots_in_repeat=logical_memories[which].repeats[0][0].slots_in_repeat;
  int num_seq=logical_memories[which].repeats[0][0].frame_seq[0].sequence_length;
  int num_bits=logical_memories[which].repeats[0][0].frame_seq[0].frame_bits[0].num_bits;

#ifdef VERBOSE
    if (logical==1)
      fprintf(stdout,"Conversion to_logical for %d quanta=%d\n",which,lookup_quanta);
    else
      fprintf(stdout,"Conversion to_physical %d quanta=%d\n",which,lookup_quanta);
#endif

    // was int
    //int *all_bits=logical_memories[which].repeats[0][0].frame_seq[0].frame_bits[0].bit_loc;
    struct frame_bits *all_bits=logical_memories[which].repeats[0][0].frame_seq[0].frame_bits;

    int bram_base=base(num_seq,num_bits,all_bits);
  // BRAM18 vs. BRAM36
    int frame_bits_len=bram_bits_in_frame(num_seq,num_bits,all_bits);

#ifdef VERBOSE  
  printf("// words=%d wordlen=%d\n",words,wordlen);
  printf("// words in repeat = %d, bits_in_repeat=%d\n",slots_in_repeat,bits_in_repeat);
  printf("// base=%d frame_bits_len=%d\n",bram_base,frame_bits_len);
#endif
  
  fprintf(cfp,"#define ACCEL_LOOKUP_QUANTA_MEM_%s_%d %d\n",logical_physical,which,lookup_quanta);

  int real_frame_bits_len=frame_bits_len; // for searching in all_bits
  int frame_bit_offset=bram_base%32; 
  frame_bits_len+=frame_bit_offset; // add more so can keep aligned 
  fprintf(cfp,"#define ACCEL_FRAME_BIT_OFFSET_%s_%d %d\n",logical_physical,which,frame_bit_offset);

  int num_trans_tables=-1; // to be defined in each case
  int u64_per_lookup_result=-1; // also to be define in each case
  uint64_t **trans_tables=(uint64_t **)NULL; // also defined in each case
  
  if (logical==0) // to physical case
    {
      fprintf(cfp,"//to_physical\n");
      // how many tables?
      // one per 8b in data (or one per 8b in frame bits)
      num_trans_tables=bits_in_repeat/lookup_quanta;
      fprintf(cfp,"#define ACCEL_LOOKUP_TABLES_PHYSICAL_%d %d\n",which,num_trans_tables);

      u64_per_lookup_result=(frame_bits_len+63)/64;
      fprintf(cfp,"#define ACCEL_U64_PER_LOOKUP_PHYSICAL_%d %d\n",which,u64_per_lookup_result);
      
#ifdef VERBOSE
      printf("allocating trans_table\n");
#endif      
      trans_tables=(uint64_t **)malloc(sizeof(uint64_t *)*num_trans_tables);

      //printf(" trans_table allocated\n"); // DEBUG

      for (int i=0;i<num_trans_tables;i++)
	{
#ifdef VERBOSE	  
	  printf("allocating trans_table[%d]\n",i);
#endif	  
	  trans_tables[i]=(uint64_t *)malloc(sizeof(uint64_t)*u64_per_lookup_result*(1<<lookup_quanta));
	  // probably fragile and mostly works for (wordlen multiple of lookup quanta)
	  // code above is enforcing that is multipler
	  for (int j=0;j<(1<<lookup_quanta);j++)
	    {
	      for(int k=0;k<lookup_quanta;k++)
		{
		  int bitpos=i*lookup_quanta+k;
		  int seqpos=bitpos/num_bits;
		  int bit_in_seq=bitpos%num_bits;
		  int bitval=((j>>k) & 0x01);
		  int frame_loc=all_bits[seqpos].bit_loc[bit_in_seq]-bram_base+frame_bit_offset;
		  int u64_word=frame_loc/64;
		  int u64_bit=frame_loc%64;
		  //		  fprintf(stderr,"CHECK_PHYSICAL bitpos %d frame_loc %d u64_word %d u64_bit %d bram_base %d frame_bit_offset %d\n",
		  //			  bitpos,frame_loc,u64_word,u64_bit,bram_base,frame_bit_offset);
		  // stick bit in frame
		  if (bitval==0)
		    {
		      uint64_t bit_mask=
			(((uint64_t)(0xFFFFFFFF)) | (((uint64_t)(0xFFFFFFFF))<<32))
			-(((uint64_t)1)<<u64_bit);
		      trans_tables[i][j*u64_per_lookup_result+u64_word]&=bit_mask;
		    }
		  else
		    trans_tables[i][j*u64_per_lookup_result+u64_word]|=(((uint64_t)1)<<u64_bit);

		}
	    }
#ifdef VERBOSE	  
	  printf("\t finished trans_table[%d]\n",i);
#endif	  
      
	}
    }
  else // to_logical case
    {
      fprintf(cfp,"//to_logical\n");
      // how many tables?
      // one per 8b in data (or one per 8b in frame bits)
      int max_bit=max_frame_bit(num_seq,num_bits,all_bits);
      fprintf(cfp,"//max_bit=%d\n",max_bit);
      num_trans_tables=(max_bit+1+(lookup_quanta-1))/lookup_quanta;
      fprintf(cfp,"#define ACCEL_LOOKUP_TABLES_LOGICAL_%d %d\n",which,num_trans_tables);

      

      // 12/19/2020 AMD -- needed to change this
      //   probably due to RAMB18s -- 64/wordlen probably not right
      //    ...maybe the min will take care of that?
      int slots_per_u64=max(min(64/wordlen,slots_in_repeat),1); // REVIEW
      fprintf(cfp,"//slots_per_u64=%d\n",slots_per_u64);

      u64_per_lookup_result=slots_in_repeat/slots_per_u64;
      if (u64_per_lookup_result==0)
	{
	  fprintf(stderr,"mem=%d wordlen=%d slots_in_repeat=%d slots_per_u64=%d u64_per_lookup_result=%d\n",
		  which,wordlen,slots_in_repeat,slots_per_u64,u64_per_lookup_result);
	  exit(2);
	}
      fprintf(cfp,"#define ACCEL_U64_PER_LOOKUP_LOGICAL_%d %d\n",which,u64_per_lookup_result);

#ifdef VERBOSE
      printf("allocating trans_table\n");
#endif      
      trans_tables=(uint64_t **)malloc(sizeof(uint64_t *)*num_trans_tables);

      for (int i=0;i<num_trans_tables;i++)
	{
#ifdef VERBOSE
	  printf("allocating trans_table[%d]\n",i);
#endif	  
	  trans_tables[i]=(uint64_t *)malloc(sizeof(uint64_t)*u64_per_lookup_result*(1<<lookup_quanta));
#ifdef CLEAR_TABLE_ON_ALLOC
	  for (int j=0;j<u64_per_lookup_result*(1<<lookup_quanta);j++)
	    trans_tables[i][j]=0;
#endif
	  // probably fragile and mostly works for (wordlen multiple of lookup quanta)
	  // code above is enforcing that is multipler
#ifdef DEBUG_LOGICAL
	  printf("memory %d table %d bits_in_use:",which,i);
#endif
	  for (int j=0;j<(1<<lookup_quanta);j++)
	    {
	      int bits_in_use=0;
	      for(int k=0;k<lookup_quanta;k++)
		{
		  int bitpos=i*lookup_quanta+k;
		  int seqpos=bitpos/num_bits;
		  int bit_in_seq=bitpos%num_bits;
		  int bitval=((j>>k) & 0x01);
		  int logical_word_offset=word_offset_from_frame_bitpos(wordlen,
									seqpos,
									bit_in_seq,
									frame_bit_offset,
									num_seq,
									num_bits,
									all_bits);
		  
		  if (logical_word_offset>=0)
		    {
#ifdef DEBUG_LOGICAL
		      if (logical_word_offset>=(u64_per_lookup_result*slots_per_u64))
			fprintf(stdout,"ERROR: Word offset=%d u64_per_lookup=%d slots_per_u64=%d\n",
				logical_word_offset,u64_per_lookup_result,slots_per_u64);
#endif		      
#ifdef DEBUG_LOGICAL_VERBOSE
		      fprintf(stdout,"[%d (%d) %d]",logical_word_offset,u64_per_lookup_result,bitpos);
#endif		      
		      int logical_bit_offset=bit_offset_from_frame_bitpos(wordlen,
									  seqpos,
									  bit_in_seq,
									  frame_bit_offset,
									  num_seq,
									  num_bits,
									  all_bits);
		      int u64_word_offset=0;
		      int u64_bit_offset=0;
		      if (slots_per_u64>0)
			{
			  u64_word_offset=logical_word_offset/slots_per_u64;
			  u64_bit_offset=(logical_word_offset%slots_per_u64)*wordlen;
			}
		      int final_bit_offset=logical_bit_offset+u64_bit_offset;
#ifdef DEBUG_LOGICAL
		      if (u64_word_offset>=u64_per_lookup_result)
			fprintf(stdout,"ERROR: u64 offset=%d u64_per_lookup=%d slots_per_u64=%d\n",
				u64_word_offset,u64_per_lookup_result,slots_per_u64);
#endif		      
		      //fprintf(stderr,"CHECK_LOGICAL bitpos %d logical_bit_offset %d final_bit_offset %d u64_word %d u64_bit %d\n",
		      //  bitpos,logical_bit_offset,final_bit_offset,u64_word_offset,u64_bit_offset);		      
		      // DEBUG
		      //fprintf(stdout,"wordlen=%d bitoffset=%d\n",wordlen,logical_bit_offset);
		      // stick bit in word
		      if (bitval==0)
			{
			  uint64_t bit_mask=
			    (((uint64_t)(0xFFFFFFFF)) | (((uint64_t)(0xFFFFFFFF))<<32))
			    -(((uint64_t)1)<<final_bit_offset);
			  trans_tables[i][j*u64_per_lookup_result+u64_word_offset]&=bit_mask;
			}
		      else
			{
			  bits_in_use++; // only count 1's
			  trans_tables[i][j*u64_per_lookup_result+u64_word_offset]|=(((uint64_t)1)<<final_bit_offset);
			}
		    }
		  else // negative word offset --> this bit does not translate to a logical bit
		    {
#ifdef DEBUG_LOGICAL_WHICH_BITS_TRANSLATED
		      fprintf(stdout,"bit %d not translate\n",bitpos);
#endif		      
		    }
		}

#ifdef DEBUG_LOGICAL		  
		  printf(" %d",bits_in_use);
#endif		  
	    }
#ifdef DEBUG_LOGICAL		  
	  printf("\n");
#endif		  
	  
	}
      
    }

#ifdef VERBOSE	  
  printf("starting common print\n");
#endif	  

  // common print routine
  for (int i=0;i<num_trans_tables;i++)
    {
      //  print table
      fprintf(cfp,"uint64_t trans_table_%s_%d_%d[]={\n // table %d\n",
	      logical_physical_lower[logical],which,i,i);
      for (int j=0;j<(1<<lookup_quanta);j++)
	{
	  int tbits=0;
	  for(int k=0;k<u64_per_lookup_result;k++)
	    {
	      fprintf(cfp,"0x%016lx",trans_tables[i][j*u64_per_lookup_result+k]);
	      tbits+=count_bits(trans_tables[i][j*u64_per_lookup_result+k]); // debug
	      if (k!=u64_per_lookup_result-1) fprintf(cfp,",");
	    }
	  if (j!=((1<<lookup_quanta)-1)) fprintf(cfp,",");
	  fprintf(cfp," // table %d entry for %x bits=%d table_bits=%d",i,j,count_bits(j),tbits); // maybe debug only
	  if (tbits>count_bits(j))
	    fprintf(cfp,"  SUSPICIOUS\n");
	  else
	    fprintf(cfp,"\n");
	}
      
      fprintf(cfp,"};\n");
    }

  fprintf(cfp,"#define ACCEL_BIT_LOW_%s_%d %d\n",logical_physical,which,bram_base);
  int bit_high=max_frame_bit(num_seq,num_bits,all_bits)+bram_base;
  fprintf(cfp,"#define ACCEL_BIT_HIGH_%s_%d %d\n",logical_physical,which,bit_high);

  fprintf(cfp,"uint64_t *trans_tables_%s_%d[]={",logical_physical_lower[logical],which);
  for (int i=0;i<num_trans_tables;i++)
    {
      if (i!=0) fprintf(cfp,",");
      fprintf(cfp,"trans_table_%s_%d_%d",logical_physical_lower[logical],which,i);
    }
  fprintf(cfp,"};\n");

  fprintf(cfp,"#define ACCEL_MEM_%s%d {",logical_physical,which); 
  fprintf(cfp,"ACCEL_LOOKUP_TABLES_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_U64_PER_LOOKUP_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_LOOKUP_QUANTA_MEM_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_FRAME_BIT_OFFSET_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_BIT_LOW_%s_%d,",logical_physical,which);
  fprintf(cfp,"ACCEL_BIT_HIGH_%s_%d,",logical_physical,which);
  fprintf(cfp,"trans_tables_%s_%d}\n",logical_physical_lower[logical],which);
  
}

int main (int argc, char **argv)
{
#ifdef VERBOSE  
  printf("//Design has %d logical memories\n", NUM_LOGICAL);
#endif

  int noaccel=0; // so accel

  int which=0;
  int lookup_quanta=8;
  char *name=(char *)NULL;
  int logical=0;

  // if running a noaccel, behave that way
  if (strstr(argv[0],"noaccel")!=(char *)NULL)
    {
      noaccel=1;
      fprintf(stderr,"No acceleration, only dummy structures to prevent acceleration.\n");
    }
  
  if (argc>1)
    {
#ifdef VERBOSE      
      fprintf(stdout,"Got name argument [%s]\n",argv[1]);
#endif      
      name=(char *)malloc(sizeof(char)*(strlen(argv[1])+20));
      sprintf(name,"%s",argv[1]);
    }
  else
    {
      name=(char *)malloc(sizeof(char)*10);
      sprintf(name,"mydesign");
    }


  fprintf(stdout,"Name: %s\n",name);

  // setup files for output
  char *c_file_name=(char *)malloc(sizeof(char)*(strlen(name)+20));
  char *h_file_name=(char *)malloc(sizeof(char)*(strlen(name)+20));
  sprintf(c_file_name,"%s.c",name);
  fprintf(stdout,"C file name: %s\n",c_file_name);


  fflush(stdout);

  FILE *cfp=fopen(c_file_name,"w");

  // TODO: maybe these go earlier (or already included for stdint)
#ifdef INCLUDE_HEADERS  
  fprintf(cfp,"#include <stdint.h>\n");
  fprintf(cfp,"#include \"compressed_bert_types.h\"\n");
  fprintf(cfp,"#include \"%s\"\n",h_file_name);
#endif  
  
  for (int i=0;i<NUM_LOGICAL;i++)
    {
      int bits_in_repeat=logical_memories[i].repeats[0][0].bits_in_repeat;
      int num_seq=logical_memories[i].repeats[0][0].frame_seq[0].sequence_length;
      int num_bits=logical_memories[i].repeats[0][0].frame_seq[0].frame_bits[0].num_bits;
      int wordlen=logical_memories[i].wordlen;
      
      if ((logical_memories[i].nframe_ranges>1)
	  ||(logical_memories[i].replicas>1)
	  ||(logical_memories[i].num_segments[0]>1)
	  ||(logical_memories[i].repeats[0][0].num_frames>1)
	  ||((num_seq*num_bits)!=bits_in_repeat)
	  ||(wordlen>64)
	  ||(noaccel==1)
	  )
	{
	  noaccel_memory(i,0,cfp);
	  noaccel_memory(i,1,cfp);
#ifdef VERBOSE	  
	  fprintf(stdout,"No acceleration for memory %d frame ranges %d replicas %d segments %d repeats %d nyn_frames %d num_seq %d num_bits %d bits_in_repeat %d wordlen %d\n",i,
		  logical_memories[i].nframe_ranges,
		  logical_memories[i].replicas,
		  logical_memories[i].num_segments[0],
		  logical_memories[i].repeats[0][0].num_repeats,
		  logical_memories[i].repeats[0][0].num_frames,
		  num_seq,
		  num_bits,
		  bits_in_repeat,
		  wordlen
		  );
#endif	  
	}
      else
	{
	  int ql=8; // quanta(32); // needs to be a multiple, so not much choice
	  process_memory(i,ql,1,cfp);
	  int qp=quanta(wordlen);
	  if (qp>0)
	    process_memory(i,qp,0,cfp);
	  else
	    noaccel_memory(i,0,cfp);
      }
    }

  // array of all the per memory structs .. like logical_memories
  fprintf(cfp,"struct accel_memory accel_memories_physical[%d]={",NUM_LOGICAL);
  for (int i=0;i<NUM_LOGICAL;i++)
    {
      if (i!=0) fprintf(cfp,",");
      fprintf(cfp,"ACCEL_MEM_PHYSICAL%d",i);
    }
  fprintf(cfp,"};\n");
  fprintf(cfp,"struct accel_memory accel_memories_logical[%d]={",NUM_LOGICAL);
  for (int i=0;i<NUM_LOGICAL;i++)
    {
      if (i!=0) fprintf(cfp,",");
      fprintf(cfp,"ACCEL_MEM_LOGICAL%d",i);
    }
  fprintf(cfp,"};\n");
  

#ifdef VERBOSE
  fprintf(stdout,"Finishing up and closing files %s %s\n",h_file_name,c_file_name);
#endif  
  fclose(cfp);

}

