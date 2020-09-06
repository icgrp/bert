Using BERT API
========================

## Adding BERT to application project

All the files that need to be added to an application are found at `bert/embedded/src/bert`. A c file using BERT should include `readback.h`, `bert.h`, and the design's `mydesign.h` produced by `bert_gen`. The application project should be created after the [bsp is configured](bsp.md), so that linker-related flags are set properly. If the application will not compile, verify the linker flags manually:

* `-Wl,--start-group,-lxilfpga,-lxil,-lxilsecure,-lgcc,-lc,--end-group`
*  `-Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group`

The linker flags are found under the project properties. Go to C/C++ Build -> Settings -> ARM v8 gcc linker -> Inferred Options -> Software Platform.

TODO: Example images of linker flags

## Usage Overview

One basic test for checking that BERT is working is to write and then read a BRAM in the design. When testing BERT for functionality, it is important to allocate the right amount of space for everything. Otherwise, out of bounds writes are very likely to happen and cause confusion when debugging. Additionally, since BRAM frame data is transferred into DDR memory, the heap size will need to be increased from the default size. Increasing by a factor of 4x from the default should be safe.

The following code can be used to test basic setup of BERT.\
TODO: Check that it compiles

```c
#include "bert.h"
#include "readback.h"
#include "ultrascale_plus.h"
#include "mydesign.h" // Include the primary design file, as well as any acceleration tables if used
#include <stdint.h>

#define CEIL(x,y) (((x) + (y) - 1) / (y))

#define WORD_COUNT 512 // Example memory's word count
#define WIDTH 72 // Bits per word in memory 
#define PART_IDCODE 0xFFFFFFFF // Part number's IDCODE, change this or bert calls will silently fail

uint64_t mem_read[CEIL(WIDTH, 64) * WORD_COUNT]; // Twos 64b words are needed for 72b
uint64_t mem_write[CEIL(WIDTH, 64) * WORD_COUNT];

XFpga XFpgaInstance = {0U};

int main(int argc, char **argv) {
     
    if (readback_Init(&XFpgaInstance, PART_IDCODE) != 0) {
        printf("readback_Init failed\r\n");
        exit(1);
    }
    
    if (bert_write(MEM_0,mem_write,&XFpgaInstance) != 0) {
        printf("bert_write failed\r\n");
        exit(1);
    }
    if (bert_read(MEM_0,mem_read,&XFpgaInstance) != 0) {
        printf("bert_read failed\r\n");
        exit(1);
    }
    
    for (int i = 0; i < WORD_COUNT; i++)
        if (mem_write[i] != mem_read[i]) {
            printf("wrote: %llx, read: %llx, word %d", mem_write[i], mem_read[i], i/2);
            exit(1);
        }
    
    printf("BERT read and write on MEM_0 working.\r\n");
    return 0;
}
```
`bert_read` and `bert_write` can be used in loops to test all memories, but they are inefficient to use on BRAMs that coincide within the same frames. Thus, using `bert_transfuse` can limit the amount of redundant DMA operations. To further reduce time spent on memory transfusions, `meminfo` can be saved and reused. This will achieve better throughput than individual BERT read/write calls, because each `bert_read` and `bert_write` reference calls `bert_transfuse`.
```c
void clearAllBRAMs() {

    struct bert_meminfo *meminfo=(struct bert_meminfo *)malloc(sizeof(struct bert_meminfo)*NUM_LOGICAL);
    for (int i = 0; i < )
    // TODO
    // TODO
    
}
```


## BERT API Calls

### `bert_read`

#### Prototype
`int  bert_read(int logicalm, uint64_t *data, XFpga *XFpgaInstance);`

#### Parameters
| Type | Name | Description |
| ---- | ---- | ----------- |
| int | logicalm | The index of the memory being operated on, as defined in the mydesign header file |
| uint64_t * | data | The array to read logical memory contents into |
|  XFpga * | XFpgaInstance | Pointer to xilfpga object initialized by `readback_Init` |

#### Returns
0 on success\
not 0 on Failure

-----

### `bert_write`

#### Prototype
`int  bert_write(int logicalm, uint64_t *data, XFpga *XFpgaInstance);`

#### Parameters
| Type | Name | Description |
| ---- | ---- | ----------- |
| int | logicalm | The index of the memory being operated on, as defined in the mydesign header file |
| uint64_t * | data | The array to write logical memory contents from |
|  XFpga * | XFpgaInstance | Pointer to xilfpga object initialized by `readback_Init` |

#### Returns
0 on success\
not 0 on Failure

-----

### `bert_transfuse`

#### Prototype
`int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga *XFpgaInstance);`

#### Parameters
| Type | Name | Description |
| ---- | ---- | ----------- |
| int | num | The number of read/write operations being performed, i.e. the length of meminfo array |
| struct bert_meminfo * | meminfo | The array that defines each read/write operation. The fields of a `bert_meminfo` operation are as follows: <br><br> `logical_mem` - Index of memory to operate on defined in mydesign header <br> `operation` - Operation type, e.g. `BERT_OPERATION_READ` <br> `data` - logical memory buffer to read/write to/from <br> `start_addr` - TODO <br> `data_length` - TODO <br> `lookup_quanta` - TODO <br> `lookup_tables` - TODO <br> `u64_per_lookup - TODO` <br> `tabsize` - TODO <br> `pointer_to_trans_tables` - TODO  |
|  XFpga * | XFpgaInstance | Pointer to xilfpga object initialized by `readback_Init` |

#### Returns
0 on success\
not 0 on Failure
