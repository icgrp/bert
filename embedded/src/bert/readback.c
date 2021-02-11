#include "xil_printf.h"
#include "xfpga_config.h"
#include "xilfpga.h"
#include "readback.h"

int readback_XilfpgaWrapper(XFpga *InstancePtr, u32 far, u32 words, u32* data);

XFpga Instance = {0U};
int globalFrameBase = 0;
int globalFrameLen = 0;
int readback_Frame(u32 frameAddr, u32 frameCnt, u32* framedata);

int readback_Init(XFpga* XFpgaInstance, u32 idcode) {
	s32 Status;
	Status = XFpga_Initialize(XFpgaInstance, idcode);
	if (Status != XFPGA_SUCCESS) {
		xil_printf("XFpga_Initialize failed\r\n");
		return XST_FAILURE;
	}
	XFpgaInstance->XFpga_GetConfigData = XFpga_GetPlConfigDataRange;
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

u32 XFpga_GetPlConfigDataRange(XFpga *InstancePtr, UINTPTR ReadbackAddr,
			  u32 NumFrames, u32 FrameAddr)
{
	u32 Status = XFPGA_FAILURE;

	Xil_AssertNonvoid(InstancePtr != NULL);

	InstancePtr->ReadInfo.ReadbackAddr = ReadbackAddr;
	globalFrameLen = NumFrames;
	globalFrameBase = FrameAddr;

	if (InstancePtr->XFpga_GetConfigData == NULL) {
		Status = XFPGA_OPS_NOT_IMPLEMENTED;
		Xfpga_Printf(XFPGA_DEBUG,
		"%s Implementation not exists..\r\n", __FUNCTION__);
	} else {
		Status = InstancePtr->XFpga_GetConfigData(InstancePtr);
	}

	return Status;
}

static u32 XFpga_GetPLConfigDataRange(const XFpga *InstancePtr)
{
	u32 Status = XFPGA_FAILURE;
	UINTPTR Address = globalFrameBase;
	u32 NumFrames = globalFrameLen;
	u32 RegVal;
	u32 cmdindex;
	u32 *CmdBuf;
	s32 i;
	u32 far = InstancePtr->ReadInfo.FarAddr;
	Status = XFpga_GetFirmwareState();

	if (Status == XFPGA_FIRMWARE_STATE_UNKNOWN) {
		Xfpga_Printf(XFPGA_DEBUG, "Error while reading configuration "
			   "data from FPGA\n\r");
		Status = XFPGA_ERROR_PLSTATE_UNKNOWN;
		goto END;
	}

	if (Status == XFPGA_FIRMWARE_STATE_SECURE) {
		Xfpga_Printf(XFPGA_DEBUG, "Operation not permitted\n\r");
		Status = XFPGA_FAILURE;
		goto END;
	}

	CmdBuf = (u32*)Address;

	/* Enable the PCAP clk */
	RegVal = Xil_In32(PCAP_CLK_CTRL);
    RegVal &= ~(0x00003F00);
	RegVal |= (PCAP_READ_DIV << 8);
	Xil_Out32(PCAP_CLK_CTRL, RegVal | PCAP_CLK_EN_MASK);

	/* Take PCAP out of Reset */
	Status = XFpga_PcapInit(1U);
	if (Status != XFPGA_SUCCESS) {
		Status = XPFGA_ERROR_PCAP_INIT;
		Xfpga_Printf(XFPGA_DEBUG, "PCAP init failed\n\r");
		goto END;
	}

	cmdindex = 0U;

	/* Step 1 */
	CmdBuf[cmdindex] = 0xFFFFFFFFU; /* Dummy Word */
	cmdindex++;
	CmdBuf[cmdindex] = 0x000000BBU; /* Bus Width Sync Word */
	cmdindex++;
	CmdBuf[cmdindex] = 0x11220044U; /* Bus Width Detect */
	cmdindex++;
	CmdBuf[cmdindex] = 0xFFFFFFFFU; /* Dummy Word */
	cmdindex++;
	CmdBuf[cmdindex] = 0xAA995566U; /* Sync Word */
	cmdindex++;

	/* Step 2 */
	CmdBuf[cmdindex] = 0x02000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;
	/* Step 3 */         /* Type 1 Write 1 Word to CMD */
	CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
	cmdindex++;
	CmdBuf[cmdindex] = 0x0000000BU; /* SHUTDOWN Command */
	cmdindex++;
	CmdBuf[cmdindex] = 0x02000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 4 */         /* Type 1 Write 1 Word to CMD */
	CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
	cmdindex++;
	CmdBuf[cmdindex] = 0x00000007U; /* RCRC Command */
	cmdindex++;
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 5 --- 5 NOOPS Words */
	for (i = 0 ; i < (s32)5 ; i++) {
		CmdBuf[cmdindex] = 0x20000000U;
		cmdindex++;
	}

	/* Step 6 */         /* Type 1 Write 1 Word to CMD */
	CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
	cmdindex++;
	CmdBuf[cmdindex] = 0x00000004U; /* RCFG Command */
	cmdindex++;
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 7 */         /* Type 1 Write 1 Word to FAR */
	CmdBuf[cmdindex] = Xfpga_RegAddr(FAR1, OPCODE_WRITE, 0x1U);
	cmdindex++;
	CmdBuf[cmdindex] = far;
	cmdindex++;

	/* Step 8 */          /* Type 1 Read 0 Words from FDRO */
	CmdBuf[cmdindex] =  Xfpga_RegAddr(FDRO, OPCODE_READ, 0U);
	cmdindex++;
			      /* Type 2 Read Wordlenght Words from FDRO */
	CmdBuf[cmdindex] = Xfpga_Type2Pkt(OPCODE_READ, NumFrames);
	cmdindex++;

	/* Step 9 --- 64 NOOPS Words */
	for (i = 0 ; i < (s32)64 ; i++) {
		CmdBuf[cmdindex] = 0x20000000U;
		cmdindex++;
	}

	XCsuDma_EnableIntr(CsuDmaPtr, XCSUDMA_DST_CHANNEL,
			   XCSUDMA_IXR_DST_MASK);

	/* Flush the DMA buffer */
	Xil_DCacheFlushRange(Address, NumFrames * 4U);

	/* Set up the Destination DMA Channel*/
	XCsuDma_Transfer(CsuDmaPtr, XCSUDMA_DST_CHANNEL,
			 Address + CFGDATA_DSTDMA_OFFSET, NumFrames, 0U);

	Status = XFpga_PcapWaitForDone();
	if (Status != XFPGA_SUCCESS) {
		Xfpga_Printf(XFPGA_DEBUG, "Write to PCAP Failed\n\r");
		Status = XFPGA_FAILURE;
		goto END;
	}

	Status = XFpga_WriteToPcap(cmdindex, Address);
	if (Status != XFPGA_SUCCESS) {
		Xfpga_Printf(XFPGA_DEBUG, "Write to PCAP Failed\n\r");
		Status = XFPGA_FAILURE;
		goto END;
	}

	/*
	 * Setup the  SSS, setup the DMA to receive from PCAP source
	 */
	Xil_Out32(CSU_CSU_SSS_CFG, XFPGA_CSU_SSS_SRC_DST_DMA);
	Xil_Out32(CSU_PCAP_RDWR, 0x1U);


	/* wait for the DST_DMA to complete and the pcap to be IDLE */
	Status = XCsuDma_WaitForDoneTimeout(CsuDmaPtr, XCSUDMA_DST_CHANNEL);
	if (Status != XFPGA_SUCCESS) {
		Xfpga_Printf(XFPGA_DEBUG, "Read from PCAP Failed\n\r");
		Status = XFPGA_FAILURE;
		goto END;
	}

	/* Acknowledge the transfer has completed */
	XCsuDma_IntrClear(CsuDmaPtr, XCSUDMA_DST_CHANNEL, XCSUDMA_IXR_DONE_MASK);

	Status = XFpga_PcapWaitForidle();
	if (Status != XFPGA_SUCCESS) {
		Xfpga_Printf(XFPGA_DEBUG, "Reading data from PL through PCAP Failed\n\r");
		Status = XFPGA_FAILURE;
		goto END;
	}

	cmdindex = 0U;
	/* Step 11 */
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 12 */
	CmdBuf[cmdindex] = 0x30008001U; /* Type 1 Write 1 Word to CMD */
	cmdindex++;
	CmdBuf[cmdindex] = 0x00000005U; /* START Command */
	cmdindex++;
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 13 */
	CmdBuf[cmdindex] = 0x30008001U; /* Type 1 Write 1 Word to CMD */
	cmdindex++;
	CmdBuf[cmdindex] = 0x00000007U; /* RCRC Command */
	cmdindex++;
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	/* Step 14 */
	CmdBuf[cmdindex] = 0x30008001U; /* Type 1 Write 1 Word to CMD */
	cmdindex++;
	CmdBuf[cmdindex] = 0x0000000DU; /* DESYNC Command */
	cmdindex++;

	/* Step 15 */
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;
	CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
	cmdindex++;

	Status = XFpga_WriteToPcap(cmdindex, (UINTPTR)Address);
	if (Status != XFPGA_SUCCESS) {
		Xfpga_Printf(XFPGA_DEBUG, "Write to PCAP 1 Failed\n\r");
		Status = XFPGA_FAILURE;
	}
END:
	/* Disable the PCAP clk */
	RegVal = Xil_In32(PCAP_CLK_CTRL);
	Xil_Out32(PCAP_CLK_CTRL, RegVal & ~(PCAP_CLK_EN_MASK));

	return Status;
}

u32 XFpga_PL_Frames_Load(XFpga *InstancePtr,
 			    UINTPTR ReadbackAddr, u32 Flags, u32 WrdCnt)
 {

	 UINTPTR ContentAddr = ReadbackAddr + CFGDATA_DSTDMA_OFFSET + BIN_READBACK_OFFSET - 7*4;
	 UINTPTR BitstreamAddr = ContentAddr - header_LEN * 4;
	 UINTPTR Size = (UINTPTR) (WrdCnt + header_LEN + footer_LEN) * 4;
	 u32* arr = (u32*) BitstreamAddr;
	 for (int i = 0; i < header_LEN; i++) {
		 arr[i] = header[i];
	 }
	 arr[158] = InstancePtr->WriteInfo.idcode;

	 arr = (u32*) (ContentAddr + WrdCnt*4);
	 for (int i = 0; i < footer_LEN; i++) {
	 		 arr[i] = footer[i];
	 }

	 return XFpga_PL_BitStream_Load(InstancePtr, (UINTPTR) BitstreamAddr, Size, Flags | XFPGA_ONLY_BIN_EN | XFPGA_PARTIAL_EN);

 }
