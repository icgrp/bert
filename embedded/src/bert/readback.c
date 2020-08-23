#include "xil_printf.h"
#include "xfpga_config.h"
#include "xilfpga.h"
#include "readback.h"

int readback_XilfpgaWrapper(XFpga *InstancePtr, u32 far, u32 words, u32* data);

XFpga Instance = {0U};

int readback_Frame(u32 frameAddr, u32 frameCnt, u32* framedata);

int readback_Init(XFpga* XFpgaInstance, u32 idcode) {
	s32 Status;
	Status = XFpga_Initialize(XFpgaInstance, idcode);
	if (Status != XFPGA_SUCCESS) {
		xil_printf("XFpga_Initialize failed\r\n");
		return XST_FAILURE;
	}
	XFpga_PL_PostConfig(XFpgaInstance); //so firmware status is not unknown, throws error otherwise
	Instance = *XFpgaInstance;
	return XST_SUCCESS;
}

int readback_Bitstream(u32* framedata) {
	s32 Status;
	u32 WrdCnt = WORDS_PER_FRAME * (FRAMES + 1) + PAD_WORDS;

	Status = XFpga_GetPlConfigData(&Instance, (UINTPTR)framedata, WrdCnt, 0);
	if (Status != XST_SUCCESS) {
		xil_printf("readback_Bitstream() failed\r\n");
		return XST_FAILURE;
	}
	xil_printf("Full bitstream readback done\r\n");

	return XST_SUCCESS;
}

int readback_Frame(u32 frameAddr, u32 frameCnt, u32* framedata) {
	s32 Status;
	u32 WrdCnt = WORDS_PER_FRAME * (frameCnt + 1) + PAD_WORDS;

	Status = XFpga_GetPlConfigData(&Instance, (UINTPTR)framedata, WrdCnt, frameAddr);
	if (Status != XST_SUCCESS) {
		xil_printf("readback_Frame(%X, %X) failed\r\n", frameAddr, frameCnt);
		return XST_FAILURE;
	}
	xil_printf("Frames %X through %X read\r\n", frameAddr, frameAddr + frameCnt - 1);

	return XST_SUCCESS;
}





