#ifndef READBACK_H
#define READBACK_H

#include "xil_types.h"
#include "xilfpga.h"

#define DATA_DMA_OFFSET 0x1FCU // Where the first readback word is. The first valid frame is 93 + 25 past this point.
#define TOTAL_WORDS WORDS_PER_FRAME * (FRAMES + 1) + DATA_DMA_OFFSET + SUFFIXLENGTH // Space for bits, dummy bits, header commands, and suffix commands


int readback_Init(XFpga* XFpgaInstance, u32 idcode);
int readback_Bitstream(u32* framedata);
int readback_Frame(u32 frameAddr, u32 frameCnt, u32* framedata);
u32 XFpga_GetPlConfigDataRange(XFpga *InstancePtr, UINTPTR ReadbackAddr, u32 NumFrames, u32 FrameAddr);
u32 XFpga_PL_Frames_Load(XFpga *InstancePtr, UINTPTR ReadbackAddr, u32 Flags, u32 WrdCnt);

#endif
