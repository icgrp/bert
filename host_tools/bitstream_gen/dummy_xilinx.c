#include <stdint.h>
#include "dummy_xilinx.h"
#include "bits.h"

uint32_t swap(uint32_t in) {
    uint16_t big = ((in & 0xFF) << 8) | ((in & 0xFF00) >> 8);
    uint16_t little = ((in & 0xFF0000) >> 8) | ((in & 0xFF000000) >> 24);
    return (big << 16) | little;
}

int XFpga_GetPlConfigDataRange(XFpga *XFpgaInstance, UINTPTR frame_data, int words, int frame_base) {
    fprintf(stderr, "bitstream_gen does not support configurations where BRAM18s have a live partner\n");
    return XST_FAILURE;
}

int XFpga_PL_Frames_Load(XFpga *InstancePtr, UINTPTR ReadbackAddr, u32 Flags, u32 WrdCnt) {
    
    UINTPTR ContentAddr = ReadbackAddr + CFGDATA_DSTDMA_OFFSET + BIN_READBACK_OFFSET - 7*4;
    UINTPTR BitstreamAddr = ContentAddr - header_LEN * 4;
    UINTPTR Size = (UINTPTR) ((WrdCnt + header_LEN + footer_LEN) * 4);
    u32* arr = (u32*) BitstreamAddr;
    for (int i = 0; i < header_LEN; i++) {
        arr[i] = header[i];
    }
    arr[158] = InstancePtr->idcode;

    arr = (u32*) (ContentAddr + WrdCnt*4);
    for (int i = 0; i < footer_LEN; i++) {
        arr[i] = footer[i];
    }

    arr = (u32*) BitstreamAddr;
    for (int i = 0; i < Size/4; i++)
        arr[i] = swap(arr[i]);

    if (InstancePtr->file == NULL) {
        fprintf(stderr, "XFpga_PL_Frames_Load: Given null pointer!\n");
        return XST_SUCCESS;
    }
    fwrite((void *) BitstreamAddr, 1, Size, InstancePtr->file);
    return XST_SUCCESS;
}

int hostwrite_Init(XFpga *XFpgaInstance, uint32_t IDCODE, FILE* out) {
    XFpgaInstance->idcode = IDCODE;
    if (out == NULL)
        return XST_FAILURE;
    XFpgaInstance->file = out;
    return XST_SUCCESS;
}
