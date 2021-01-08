#include <stdint.h>
#include "dummy_xilinx.h"

int XFpga_GetPlConfigData(XFpga *XFpgaInstance, UINTPTR frame_data, int words, int frame_base) {
    return(XST_SUCCESS);
}

int XFpga_PL_Frames_Load(XFpga *XFpgaInstance,UINTPTR frame_data,int Flags,int len) {
  // dummy to make sure data comes back zero
    for (int i=0;i<len;i++)
        frame_data[i]=0;
  
    return XST_SUCCESS;
}

int readback_Init(XFpga *XFpgaInstance, uint32_t IDCODE) {
    return XST_SUCCESS;
}

void set_file(XFpga *XFpgaInstance, FILE* f) {
    XFpgaInstance->file = f;
}
