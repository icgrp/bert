#include <stdio.h>

#define XST_SUCCESS 1
#define XST_FAILURE 0
#define s32 int
#define u32 uint32_t

#define UINTPTR uint32_t *
#define XFPGA_PARTIAL_EN 0x01
#define XFPGA_ONLY_BIN_EN 0x02

typedef struct dummy {
  uint64_t value;
  uint32_t idcode;
  FILE* file;
} XFpga;


int XFpga_GetPlConfigData(XFpga *XFpgaInstance, UINTPTR frame_data, int words, int frame_base);
int XFpga_PL_Frames_Load(XFpga *XFpgaInstance,UINTPTR frame_data,int Flags,int len);
int readback_Init(XFpga *XFpgaInstance, uint32_t IDCODE);
void set_file(XFpga *XFpgaInstance, FILE* f);
