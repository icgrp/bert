#include <stdio.h>
#include <stdint.h>
#include "compressed_bert_types.h"
#define NUM_LOGICAL 4
int bert_compress_version=3; // non-uniform memory, ramb18 wes
int words_per_frame=93;
int frames_per_bram=256;
int words_between_frames=7;
int words_after_frames=54;
int words_before_frames=196;
int pad_words=25;
int we_bits_per_frame=12;
int bitlocation[12]={115,323,595,803,1075,1283,1651,1859,2131,2339,2611,2819};
int bram_starts[13]={0,240,480,720,960,1200,1536,1776,2016,2256,2496,2736,2976};
const char *logical_names[] = {"design_1_i/top_0/inst/HUFFMAN/CONSUMER/resultsMem","design_1_i/top_0/inst/HUFFMAN/ENCODER/HIST/histMem","design_1_i/top_0/inst/HUFFMAN/ENCODER/inst/HUFFMAN/ENCODER/huffmanMem","design_1_i/top_0/inst/HUFFMAN/PRODUCER/inst/HUFFMAN/PRODUCER/rawTextMem"};
// Beginning of Logical Memory 0
// Beginning of Logical Memory 1
// Beginning of Logical Memory 2
// Beginning of Logical Memory 3
int mem0num_segments[1]={1};
int mem1num_segments[1]={1};
int mem2num_segments[1]={1};
int mem3num_segments[1]={1};
struct compressed_frame_range mem0_frame_ranges[1]={{0x1040100, 256, 0x100,0}};
struct compressed_frame_range mem1_frame_ranges[1]={{0x10401c0, 64, 0x400,0}};
struct compressed_frame_range mem2_frame_ranges[1]={{0x1040100, 256, 0x40,1}};
struct compressed_frame_range mem3_frame_ranges[1]={{0x1040100, 256, 0x80,1}};
int16_t mem0replica0seg0frame_bits0bit_loc0[16]={960,972,984,996,1020,1032,1044,1056,966,978,990,1002,1026,1038,1050,1062};
int16_t mem0replica0seg0frame_bits0bit_loc1[16]={963,975,987,999,1023,1035,1047,1059,969,981,993,1005,1029,1041,1053,1065};
int16_t mem0replica0seg0frame_bits0bit_loc2[16]={962,974,986,998,1022,1034,1046,1058,968,980,992,1004,1028,1040,1052,1064};
int16_t mem0replica0seg0frame_bits0bit_loc3[16]={965,977,989,1001,1025,1037,1049,1061,971,983,995,1007,1031,1043,1055,1067};
struct frame_bits mem0replica0seg0frame_bits0[4]={{16,mem0replica0seg0frame_bits0bit_loc0},{16,mem0replica0seg0frame_bits0bit_loc1},{16,mem0replica0seg0frame_bits0bit_loc2},{16,mem0replica0seg0frame_bits0bit_loc3}};
struct frame_sequence mem0replica0seg0frame_sequence[1]={{0x1040100,4,mem0replica0seg0frame_bits0}};
int mem0replica0seg0unique_frames[1]={0x1040100};
struct segment_repeats mem0replica0repeats[1]={{256,1,64,4,1,mem0replica0seg0frame_sequence,mem0replica0seg0unique_frames}
};
struct segment_repeats *mem0repeats[1]={mem0replica0repeats};
int16_t mem1replica0seg0frame_bits0bit_loc0[16]={1200,1212,1224,1236,1260,1272,1284,1296,1206,1218,1230,1242,1266,1278,1290,1302};
int16_t mem1replica0seg0frame_bits0bit_loc1[16]={1203,1215,1227,1239,1263,1275,1287,1299,1209,1221,1233,1245,1269,1281,1293,1305};
int16_t mem1replica0seg0frame_bits0bit_loc2[16]={1202,1214,1226,1238,1262,1274,1286,1298,1208,1220,1232,1244,1268,1280,1292,1304};
int16_t mem1replica0seg0frame_bits0bit_loc3[16]={1205,1217,1229,1241,1265,1277,1289,1301,1211,1223,1235,1247,1271,1283,1295,1307};
struct frame_bits mem1replica0seg0frame_bits0[4]={{16,mem1replica0seg0frame_bits0bit_loc0},{16,mem1replica0seg0frame_bits0bit_loc1},{16,mem1replica0seg0frame_bits0bit_loc2},{16,mem1replica0seg0frame_bits0bit_loc3}};
struct frame_sequence mem1replica0seg0frame_sequence[1]={{0x10401c0,4,mem1replica0seg0frame_bits0}};
int mem1replica0seg0unique_frames[1]={0x10401c0};
struct segment_repeats mem1replica0repeats[1]={{64,1,64,4,1,mem1replica0seg0frame_sequence,mem1replica0seg0unique_frames}
};
struct segment_repeats *mem1repeats[1]={mem1replica0repeats};
int16_t mem2replica0seg0frame_bits0bit_loc0[20]={720,732,744,756,780,792,804,816,726,738,750,762,786,798,810,822,723,735,747,759};
int16_t mem2replica0seg0frame_bits0bit_loc1[20]={722,734,746,758,782,794,806,818,728,740,752,764,788,800,812,824,725,737,749,761};
struct frame_bits mem2replica0seg0frame_bits0[2]={{20,mem2replica0seg0frame_bits0bit_loc0},{20,mem2replica0seg0frame_bits0bit_loc1}};
struct frame_sequence mem2replica0seg0frame_sequence[1]={{0x1040100,2,mem2replica0seg0frame_bits0}};
int mem2replica0seg0unique_frames[1]={0x1040100};
struct segment_repeats mem2replica0repeats[1]={{256,1,40,2,1,mem2replica0seg0frame_sequence,mem2replica0seg0unique_frames}
};
struct segment_repeats *mem2repeats[1]={mem2replica0repeats};
int16_t mem3replica0seg0frame_bits0bit_loc0[8]={852,864,876,888,912,924,936,948};
int16_t mem3replica0seg0frame_bits0bit_loc1[8]={855,867,879,891,915,927,939,951};
int16_t mem3replica0seg0frame_bits0bit_loc2[8]={854,866,878,890,914,926,938,950};
int16_t mem3replica0seg0frame_bits0bit_loc3[8]={857,869,881,893,917,929,941,953};
struct frame_bits mem3replica0seg0frame_bits0[4]={{8,mem3replica0seg0frame_bits0bit_loc0},{8,mem3replica0seg0frame_bits0bit_loc1},{8,mem3replica0seg0frame_bits0bit_loc2},{8,mem3replica0seg0frame_bits0bit_loc3}};
struct frame_sequence mem3replica0seg0frame_sequence[1]={{0x1040100,4,mem3replica0seg0frame_bits0}};
int mem3replica0seg0unique_frames[1]={0x1040100};
struct segment_repeats mem3replica0repeats[1]={{256,1,32,4,1,mem3replica0seg0frame_sequence,mem3replica0seg0unique_frames}
};
struct segment_repeats *mem3repeats[1]={mem3replica0repeats};
struct compressed_logical_memory  logical_memories[NUM_LOGICAL]={
	{1,16,1024,1,mem0num_segments,mem0_frame_ranges,mem0repeats}
,	{1,16,256,1,mem1num_segments,mem1_frame_ranges,mem1repeats}
,	{1,20,512,1,mem2num_segments,mem2_frame_ranges,mem2repeats}
,	{1,8,1024,1,mem3num_segments,mem3_frame_ranges,mem3repeats}
};
#define ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_0 -1
#define ACCEL_FRAME_BIT_OFFSET_PHYSICAL_0 0
#define ACCEL_LOOKUP_TABLES_PHYSICAL_0 0
#define ACCEL_U64_PER_LOOKUP_PHYSICAL_0 0
#define ACCEL_BIT_LOW_PHYSICAL_0 0
#define ACCEL_BIT_HIGH_PHYSICAL_0 0
#define ACCEL_MEM_PHYSICAL0 {ACCEL_LOOKUP_TABLES_PHYSICAL_0,ACCEL_U64_PER_LOOKUP_PHYSICAL_0,ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_0,ACCEL_FRAME_BIT_OFFSET_PHYSICAL_0,ACCEL_BIT_LOW_PHYSICAL_0,ACCEL_BIT_HIGH_PHYSICAL_0,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_0 -1
#define ACCEL_FRAME_BIT_OFFSET_LOGICAL_0 0
#define ACCEL_LOOKUP_TABLES_LOGICAL_0 0
#define ACCEL_U64_PER_LOOKUP_LOGICAL_0 0
#define ACCEL_BIT_LOW_LOGICAL_0 0
#define ACCEL_BIT_HIGH_LOGICAL_0 0
#define ACCEL_MEM_LOGICAL0 {ACCEL_LOOKUP_TABLES_LOGICAL_0,ACCEL_U64_PER_LOOKUP_LOGICAL_0,ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_0,ACCEL_FRAME_BIT_OFFSET_LOGICAL_0,ACCEL_BIT_LOW_LOGICAL_0,ACCEL_BIT_HIGH_LOGICAL_0,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_1 -1
#define ACCEL_FRAME_BIT_OFFSET_PHYSICAL_1 0
#define ACCEL_LOOKUP_TABLES_PHYSICAL_1 0
#define ACCEL_U64_PER_LOOKUP_PHYSICAL_1 0
#define ACCEL_BIT_LOW_PHYSICAL_1 0
#define ACCEL_BIT_HIGH_PHYSICAL_1 0
#define ACCEL_MEM_PHYSICAL1 {ACCEL_LOOKUP_TABLES_PHYSICAL_1,ACCEL_U64_PER_LOOKUP_PHYSICAL_1,ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_1,ACCEL_FRAME_BIT_OFFSET_PHYSICAL_1,ACCEL_BIT_LOW_PHYSICAL_1,ACCEL_BIT_HIGH_PHYSICAL_1,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_1 -1
#define ACCEL_FRAME_BIT_OFFSET_LOGICAL_1 0
#define ACCEL_LOOKUP_TABLES_LOGICAL_1 0
#define ACCEL_U64_PER_LOOKUP_LOGICAL_1 0
#define ACCEL_BIT_LOW_LOGICAL_1 0
#define ACCEL_BIT_HIGH_LOGICAL_1 0
#define ACCEL_MEM_LOGICAL1 {ACCEL_LOOKUP_TABLES_LOGICAL_1,ACCEL_U64_PER_LOOKUP_LOGICAL_1,ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_1,ACCEL_FRAME_BIT_OFFSET_LOGICAL_1,ACCEL_BIT_LOW_LOGICAL_1,ACCEL_BIT_HIGH_LOGICAL_1,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_2 -1
#define ACCEL_FRAME_BIT_OFFSET_PHYSICAL_2 0
#define ACCEL_LOOKUP_TABLES_PHYSICAL_2 0
#define ACCEL_U64_PER_LOOKUP_PHYSICAL_2 0
#define ACCEL_BIT_LOW_PHYSICAL_2 0
#define ACCEL_BIT_HIGH_PHYSICAL_2 0
#define ACCEL_MEM_PHYSICAL2 {ACCEL_LOOKUP_TABLES_PHYSICAL_2,ACCEL_U64_PER_LOOKUP_PHYSICAL_2,ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_2,ACCEL_FRAME_BIT_OFFSET_PHYSICAL_2,ACCEL_BIT_LOW_PHYSICAL_2,ACCEL_BIT_HIGH_PHYSICAL_2,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_2 -1
#define ACCEL_FRAME_BIT_OFFSET_LOGICAL_2 0
#define ACCEL_LOOKUP_TABLES_LOGICAL_2 0
#define ACCEL_U64_PER_LOOKUP_LOGICAL_2 0
#define ACCEL_BIT_LOW_LOGICAL_2 0
#define ACCEL_BIT_HIGH_LOGICAL_2 0
#define ACCEL_MEM_LOGICAL2 {ACCEL_LOOKUP_TABLES_LOGICAL_2,ACCEL_U64_PER_LOOKUP_LOGICAL_2,ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_2,ACCEL_FRAME_BIT_OFFSET_LOGICAL_2,ACCEL_BIT_LOW_LOGICAL_2,ACCEL_BIT_HIGH_LOGICAL_2,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_3 -1
#define ACCEL_FRAME_BIT_OFFSET_PHYSICAL_3 0
#define ACCEL_LOOKUP_TABLES_PHYSICAL_3 0
#define ACCEL_U64_PER_LOOKUP_PHYSICAL_3 0
#define ACCEL_BIT_LOW_PHYSICAL_3 0
#define ACCEL_BIT_HIGH_PHYSICAL_3 0
#define ACCEL_MEM_PHYSICAL3 {ACCEL_LOOKUP_TABLES_PHYSICAL_3,ACCEL_U64_PER_LOOKUP_PHYSICAL_3,ACCEL_LOOKUP_QUANTA_MEM_PHYSICAL_3,ACCEL_FRAME_BIT_OFFSET_PHYSICAL_3,ACCEL_BIT_LOW_PHYSICAL_3,ACCEL_BIT_HIGH_PHYSICAL_3,(uint64_t **)NULL}
#define ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_3 -1
#define ACCEL_FRAME_BIT_OFFSET_LOGICAL_3 0
#define ACCEL_LOOKUP_TABLES_LOGICAL_3 0
#define ACCEL_U64_PER_LOOKUP_LOGICAL_3 0
#define ACCEL_BIT_LOW_LOGICAL_3 0
#define ACCEL_BIT_HIGH_LOGICAL_3 0
#define ACCEL_MEM_LOGICAL3 {ACCEL_LOOKUP_TABLES_LOGICAL_3,ACCEL_U64_PER_LOOKUP_LOGICAL_3,ACCEL_LOOKUP_QUANTA_MEM_LOGICAL_3,ACCEL_FRAME_BIT_OFFSET_LOGICAL_3,ACCEL_BIT_LOW_LOGICAL_3,ACCEL_BIT_HIGH_LOGICAL_3,(uint64_t **)NULL}
struct accel_memory accel_memories_physical[4]={ACCEL_MEM_PHYSICAL0,ACCEL_MEM_PHYSICAL1,ACCEL_MEM_PHYSICAL2,ACCEL_MEM_PHYSICAL3};
struct accel_memory accel_memories_logical[4]={ACCEL_MEM_LOGICAL0,ACCEL_MEM_LOGICAL1,ACCEL_MEM_LOGICAL2,ACCEL_MEM_LOGICAL3};
