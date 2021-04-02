#include "xil_printf.h"
#include "xfpga_config.h"
#include "xilfpga.h"
#include "xilfpga_pcap.h"
#include "xilfpga_extension.h"
#include "bits.h"

// Repeat definitions from xilfpga
/* Firmware State Definitions */
#define XFPGA_FIRMWARE_STATE_UNKNOWN 0U
#define XFPGA_FIRMWARE_STATE_SECURE 1U
#define XFPGA_FIRMWARE_STATE_NONSECURE 2U

#define PCAP_READ_DIV 10
#define PCAP_WRITE_DIV 4

#define CFGREG_SRCDMA_OFFSET 0x8U
#define CFGDATA_DSTDMA_OFFSET 0x1FCU
#define BIN_READBACK_OFFSET (93 + 25) * 4

#define XDC_TYPE_SHIFT 29U
#define XDC_REGISTER_SHIFT 13U
#define XDC_OP_SHIFT 27U
#define XDC_TYPE_1 1U
#define XDC_TYPE_2 2U
#define OPCODE_NOOP 0U
#define OPCODE_READ 1U
#define OPCODE_WRITE 2U
#define XFPGA_DESTINATION_PCAP_ADDR (0XFFFFFFFFU)
#define XFPGA_PART_IS_ENC (0x00000080U)
#define XFPGA_PART_IS_AUTH (0x00008000U)
#define DUMMY_BYTE (0xFFU)
#define SYNC_BYTE_POSITION 64U
#define BOOTGEN_DATA_OFFSET 0x2800U
#define XFPGA_ADDR_WORD_ALIGN_MASK (0x3U)

// Repeat static methods/variables from xilfpga
static XFpga Instance = {0U};
static u32 globalIDCODE = -1;
static XCsuDma *CsuDmaPtr;
static u32 XFpga_GetPLConfigDataRange(const XFpga *InstancePtr);

// Fields missing from xilfpga
static int globalFrameBase = 0;
static int globalFrameLen = 0;

int readback_Init(XFpga *XFpgaInstance, u32 idcode)
{
    s32 Status;
    Status = XFpga_Initialize(XFpgaInstance);
    if (Status != XFPGA_SUCCESS)
    {
        xil_printf("XFpga_Initialize failed\r\n");
        return XST_FAILURE;
    }
    globalIDCODE = idcode;
    // Redirect the readback routine
    XFpgaInstance->XFpga_GetConfigData = XFpga_GetPLConfigDataRange;
    XFpga_PL_PostConfig(XFpgaInstance); //so firmware status is not unknown, throws error otherwise
    CsuDmaPtr = Xsecure_GetCsuDma();    // this should be the same everytime
    Instance = *XFpgaInstance;
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

    if (InstancePtr->XFpga_GetConfigData == NULL)
    {
        Status = XFPGA_OPS_NOT_IMPLEMENTED;
        Xfpga_Printf(XFPGA_DEBUG,
                     "%s Implementation not exists..\r\n", __FUNCTION__);
    }
    else
    {
        Status = InstancePtr->XFpga_GetConfigData(InstancePtr);
    }

    return Status;
}

static u32 XFpga_WriteToPcap(u32 Size, UINTPTR BitstreamAddr)
{
    u32 Status = XFPGA_FAILURE;

    /*
	 * Setup the  SSS, setup the PCAP to receive from DMA source
	 */
    Xil_Out32(CSU_CSU_SSS_CFG, XFPGA_CSU_SSS_SRC_SRC_DMA);
    Xil_Out32(CSU_PCAP_RDWR, 0x0U);

    /* Setup the source DMA channel */
    XCsuDma_Transfer(CsuDmaPtr, XCSUDMA_SRC_CHANNEL, BitstreamAddr, Size, 0U);

    /* wait for the SRC_DMA to complete and the pcap to be IDLE */
    Status = XCsuDma_WaitForDoneTimeout(CsuDmaPtr, XCSUDMA_SRC_CHANNEL);
    if (Status != XFPGA_SUCCESS)
    {
        goto END;
    }

    /* Acknowledge the transfer has completed */
    XCsuDma_IntrClear(CsuDmaPtr, XCSUDMA_SRC_CHANNEL, XCSUDMA_IXR_DONE_MASK);

    Status = Xil_WaitForEvent(CSU_PCAP_STATUS,
                              PCAP_STATUS_PCAP_WR_IDLE_MASK,
                              PCAP_STATUS_PCAP_WR_IDLE_MASK,
                              PL_DONE_POLL_COUNT);
END:
    return Status;
}
static u32 Xfpga_RegAddr(u8 Register, u8 OpCode, u16 Size)
{

    /*
	 * Type 1 Packet Header Format
	 * The header section is always a 32-bit word.
	 *
	 * HeaderType | Opcode | Register Address | Reserved | Word Count
	 * [31:29]      [28:27]         [26:13]      [12:11]     [10:0]
	 * --------------------------------------------------------------
	 *   001          xx      RRRRRRRRRxxxxx        RR      xxxxxxxxxxx
	 *
	 * ï¿½Rï¿½ means the bit is not used and reserved for future use.
	 * The reserved bits should be written as 0s.
	 *
	 * Generating the Type 1 packet header which involves sifting of Type 1
	 * Header Mask, Register value and the OpCode which is 01 in this case
	 * as only read operation is to be carried out and then performing OR
	 * operation with the Word Length.
	 */
    return ((u32)(((u32)XDC_TYPE_1 << (u32)XDC_TYPE_SHIFT) |
                  ((u32)Register << (u32)XDC_REGISTER_SHIFT) |
                  ((u32)OpCode << (u32)XDC_OP_SHIFT)) |
            (u32)Size);
}

static u32 XFpga_GetPLConfigDataRange(const XFpga *InstancePtr)
{
    u32 Status = XFPGA_FAILURE;
    UINTPTR Address = InstancePtr->ReadInfo.ReadbackAddr;
    u32 NumFrames = globalFrameLen;
    u32 RegVal;
    u32 cmdindex;
    u32 *CmdBuf;
    s32 i;
    u32 far = globalFrameBase;
    Status = (Xil_In32(PMU_GLOBAL_GEN_STORAGE5) & XFPGA_STATE_MASK) >>
             XFPGA_STATE_SHIFT;

    if (Status == XFPGA_FIRMWARE_STATE_UNKNOWN)
    {
        Xfpga_Printf(XFPGA_DEBUG, "Error while reading configuration "
                                  "data from FPGA\n\r");
        Status = XFPGA_ERROR_PLSTATE_UNKNOWN;
        goto END;
    }

    if (Status == XFPGA_FIRMWARE_STATE_SECURE)
    {
        Xfpga_Printf(XFPGA_DEBUG, "Operation not permitted\n\r");
        Status = XFPGA_FAILURE;
        goto END;
    }

    CmdBuf = (u32 *)Address;

    /* Enable the PCAP clk */
    RegVal = Xil_In32(PCAP_CLK_CTRL);
    RegVal &= ~(0x00003F00);
    RegVal |= (PCAP_READ_DIV << 8);
    Xil_Out32(PCAP_CLK_CTRL, RegVal | PCAP_CLK_EN_MASK);

    /* Take PCAP out of Reset */
    RegVal = Xil_In32(CSU_PCAP_RESET);
    RegVal &= (~CSU_PCAP_RESET_RESET_MASK);
    Xil_Out32(CSU_PCAP_RESET, RegVal);

    /* Select PCAP mode and change PCAP to write mode */
    RegVal = CSU_PCAP_CTRL_PCAP_PR_MASK;
    Xil_Out32(CSU_PCAP_CTRL, RegVal);
    Xil_Out32(CSU_PCAP_RDWR, 0x0U);
    Status = Xil_WaitForEvent(CSU_PCAP_STATUS,
                              CSU_PCAP_STATUS_PL_INIT_MASK,
                              CSU_PCAP_STATUS_PL_INIT_MASK,
                              PL_DONE_POLL_COUNT);
    if (Status != XFPGA_SUCCESS)
    {
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
    /* Step 3 */ /* Type 1 Write 1 Word to CMD */
    CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
    cmdindex++;
    CmdBuf[cmdindex] = 0x0000000BU; /* SHUTDOWN Command */
    cmdindex++;
    CmdBuf[cmdindex] = 0x02000000U; /* Type 1 NOOP Word 0 */
    cmdindex++;

    /* Step 4 */ /* Type 1 Write 1 Word to CMD */
    CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
    cmdindex++;
    CmdBuf[cmdindex] = 0x00000007U; /* RCRC Command */
    cmdindex++;
    CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
    cmdindex++;

    /* Step 5 --- 5 NOOPS Words */
    for (i = 0; i < (s32)5; i++)
    {
        CmdBuf[cmdindex] = 0x20000000U;
        cmdindex++;
    }

    /* Step 6 */ /* Type 1 Write 1 Word to CMD */
    CmdBuf[cmdindex] = Xfpga_RegAddr(CMD, OPCODE_WRITE, 0x1U);
    cmdindex++;
    CmdBuf[cmdindex] = 0x00000004U; /* RCFG Command */
    cmdindex++;
    CmdBuf[cmdindex] = 0x20000000U; /* Type 1 NOOP Word 0 */
    cmdindex++;

    /* Step 7 */ /* Type 1 Write 1 Word to FAR */
    CmdBuf[cmdindex] = Xfpga_RegAddr(FAR1, OPCODE_WRITE, 0x1U);
    cmdindex++;
    CmdBuf[cmdindex] = far;
    cmdindex++;

    /* Step 8 */ /* Type 1 Read 0 Words from FDRO */
    CmdBuf[cmdindex] = Xfpga_RegAddr(FDRO, OPCODE_READ, 0U);
    cmdindex++;
    /* Type 2 Read Wordlenght Words from FDRO */
    CmdBuf[cmdindex] = ((u32)(((u32)XDC_TYPE_2 << (u32)XDC_TYPE_SHIFT) |
                              ((u32)OPCODE_READ << (u32)XDC_OP_SHIFT)) |
                        (u32)NumFrames);
    ;
    cmdindex++;

    /* Step 9 --- 64 NOOPS Words */
    for (i = 0; i < (s32)64; i++)
    {
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

    Status = Xil_WaitForEvent(CSU_PCAP_STATUS,
                              PCAP_STATUS_PCAP_WR_IDLE_MASK,
                              PCAP_STATUS_PCAP_WR_IDLE_MASK,
                              PL_DONE_POLL_COUNT);
    if (Status != XFPGA_SUCCESS)
    {
        Xfpga_Printf(XFPGA_DEBUG, "Write to PCAP Failed\n\r");
        Status = XFPGA_FAILURE;
        goto END;
    }

    Status = XFpga_WriteToPcap(cmdindex, Address);
    if (Status != XFPGA_SUCCESS)
    {
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
    if (Status != XFPGA_SUCCESS)
    {
        Xfpga_Printf(XFPGA_DEBUG, "Read from PCAP Failed\n\r");
        Status = XFPGA_FAILURE;
        goto END;
    }

    /* Acknowledge the transfer has completed */
    XCsuDma_IntrClear(CsuDmaPtr, XCSUDMA_DST_CHANNEL, XCSUDMA_IXR_DONE_MASK);

    Status = Xil_WaitForEvent(CSU_PCAP_STATUS,
                              PCAP_STATUS_PCAP_RD_IDLE_MASK,
                              PCAP_STATUS_PCAP_RD_IDLE_MASK,
                              PL_DONE_POLL_COUNT);
    if (Status != XFPGA_SUCCESS)
    {
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
    if (Status != XFPGA_SUCCESS)
    {
        Xfpga_Printf(XFPGA_DEBUG, "Write to PCAP 1 Failed\n\r");
        Status = XFPGA_FAILURE;
    }
END:
    /* Disable the PCAP clk */
    RegVal = Xil_In32(PCAP_CLK_CTRL);
    Xil_Out32(PCAP_CLK_CTRL, RegVal & ~(PCAP_CLK_EN_MASK));

    return Status;
}

// Wrapper around bitstream load that enables targetted partial reconfiguration
u32 XFpga_PL_Frames_Load(XFpga *InstancePtr,
                         UINTPTR ReadbackAddr, u32 Flags, u32 WrdCnt)
{

    UINTPTR ContentAddr = ReadbackAddr + CFGDATA_DSTDMA_OFFSET + BIN_READBACK_OFFSET - 7 * 4;
    UINTPTR BitstreamAddr = ContentAddr - header_LEN * 4;
    UINTPTR Size = (UINTPTR)(WrdCnt + header_LEN + footer_LEN) * 4;
    u32 *arr = (u32 *)BitstreamAddr;
    for (int i = 0; i < header_LEN; i++)
    {
        arr[i] = header[i];
    }
    arr[158] = globalIDCODE;

    arr = (u32 *)(ContentAddr + WrdCnt * 4);
    for (int i = 0; i < footer_LEN; i++)
    {
        arr[i] = footer[i];
    }

    // Set the PCAP Clk divider, but don't enable the CLK
    u32 RegVal = Xil_In32(PCAP_CLK_CTRL);
    RegVal &= ~(0x00003F00);
    RegVal |= (PCAP_WRITE_DIV << 8);
    Xil_Out32(PCAP_CLK_CTRL, RegVal);

    return XFpga_PL_BitStream_Load(InstancePtr, (UINTPTR)BitstreamAddr, Size, Flags | XFPGA_ONLY_BIN_EN | XFPGA_PARTIAL_EN);
}
