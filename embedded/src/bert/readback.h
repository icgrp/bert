#ifndef READBACK_H
#define READBACK_H

#include "xil_types.h"
#include "xilfpga.h"

#define IDCODE_MASK   0x0FFFFFFF
#define FRAMES		14964 // Total num frames
#define WORDS_PER_FRAME 93
#define PAD_WORDS	25 // dummy words from pipelining
#define TOTAL_WORDS WORDS_PER_FRAME * (FRAMES + 1) + 0x1FCU + SUFFIXLENGTH // Space for bits, dummy bits, header commands, and suffix commands


int readback_Init(XFpga* XFpgaInstance, u32 idcode);
int readback_Bitstream(u32* framedata);
int readback_Frame(u32 frameAddr, u32 frameCnt, u32* framedata);

#endif
