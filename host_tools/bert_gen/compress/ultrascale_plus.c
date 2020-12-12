int bitlocation[12]={115,323,595,803,1075,1283,1651,1859,2131,2339,2611,2819};
// fake for 7020
//int bram_starts[13]={0,320,640,960,1280,1632,1952,2272,2592,2912,3232,3232,3232};
// real thing
int bram_starts[13]={0,240,480,720,960,1200,1536,1776,2016,2256,2496,2736,2976};
// first bass just add 120 ... probably good enough for identifying webits
//   maybe need better for identifying actual offset
//  e.g. look like 372 is the actual start rather than 360
//   but useful bits in first half end before that
//  e.g. 101 is last bit in first ramb18
int bram18_starts[25]={0,120,240,360,480,600,720,840,960,1080,1200,1320,
		       1536,1656,1776,1896,2016,2136,2256,2376,2496,2616,2736,2856,2976};



