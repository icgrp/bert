Using BERT API
========================

## Adding BERT to application project

All the files that need to be added to an application are found at `bert/embedded/src/bert`. Code using the BERT API should `#include` `readback.h`, `bert.h`, and the design's `mydesign.h` produced by `bert_gen`. The application project should be created after the [bsp is configured](bsp.md), so that linker-related flags are set properly. If the application will not compile, verify the SDK project's linker flags manually:

* `-Wl,--start-group,-lxilfpga,-lxil,-lxilsecure,-lgcc,-lc,--end-group`
*  `-Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group`

The linker flags are found under the project properties. Go to C/C++ Build -> Settings -> ARM v8 gcc linker -> Inferred Options -> Software Platform.

TODO: Example images of linker flags

## Usage Overview

### Source and Destination Buffers
When testing BERT for functionality, it is important to allocate the right amount of space for the source and destination buffers passed to the BERT API. Otherwise, out of bounds writes are very likely to happen and cause confusion when debugging. All buffers should be of type `uint64_t`, no matter the word size of the logical memory. When the logical memory has word sizes larger than 64b, two 64b values need to be allocated such that the lower bits are stored in `bram[i]` and the high bits in `bram[i+1]`.

### Dynamic Memory Usage
Since BRAM frame data is transferred into DDR memory, the size of the heap is something to consider. The default heap size is 2 * 16^3 = 8192 bytes, or just around 8kB. BRAMs take up more space in the physical format (as configuration frames), so the heap size should be set accordingly. For example, using all 216 BRAMs on the xczu3eg will take 216 / 12 BRAMs per frameset * 257 frames per set * 372 bytes per frame = 1.72MB of space on the heap. When including other sources of overhead, you are looking at 1.73MB. However, in the general case it cannot be assumed that BRAMs coincide within the same configuration frames. Thus, it is best to allocate one frameset's worth of space (~96kB) for each BRAM or 1.73MB for all BRAMs on the chip. Setting the heap and stack size in Xilinx SDK is covered in the [setup tutorial](../tutorials/sdksetup.md).

### Code for Testing BERT
The basic test to check that BERT is working is to write and then read from a BRAM in the design. The following code can be used to verify BERT write operations.\
TODO: Check that it compiles
TODO: doe this need an associated design for them to use this with?

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
`bert_read` and `bert_write` can be used in loops to operate on all memories, but they are inefficient to use on BRAMs that coincide within the same frames. Thus, using `bert_transfuse` can limit the amount of redundant DMA operations. Furthermore, `bert_tranfuse` allows the `meminfo` struct to be saved and reused. This will achieve higher throughput than individual BERT read/write calls, because each `bert_read` and `bert_write` call is a wrapper around `bert_transfuse`.

The following function is an example of how you could write a function to initalize BRAMs in a design in one fell swoop.
```c
XFpga instance = {0U}; // Make sure to call readback_Init to initialize the XFpga object somewhere

void writeAllBRAMs() {
    
    // Initialize BRAM data; assumes all logical memories are same size
    static uint64_t data[CEIL(WIDTH, 64) * WORD_COUNT] = {0UL};
    
    struct bert_meminfo *meminfo=(struct bert_meminfo *)malloc(sizeof(struct bert_meminfo) * NUM_LOGICAL);
    for (int i = 0; i < NUM_LOGICAL; i++) {
        meminfo[i].logical_mem=i;
        meminfo[i].operation=BERT_OPERATION_WRITE;
	   meminfo[i].data=data;
	   meminfo[i].start_addr=0;
	   meminfo[i].data_length=WORD_COUNT; // Assuming all BRAMs are same size
    }
    bert_transfuse(NUM_LOGICAL, meminfo, &instance);
    free(meminfo);
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
int other than 0 on failure

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
int other than 0 on failure

-----

### `bert_transfuse`

#### Prototype
`int  bert_transfuse(int num, struct bert_meminfo *meminfo, XFpga *XFpgaInstance);`

#### Parameters
| Type | Name | Description |
| ---- | ---- | ----------- |
| int | num | The number of read/write operations being performed, i.e. the length of meminfo array |
| struct bert_meminfo * | meminfo | The array that defines each read/write operation. The fields of a `bert_meminfo` operation are as follows: <br><br> `logical_mem` - Index of memory to operate on defined in mydesign header <br> `operation` - Operation type, e.g. `BERT_OPERATION_READ` <br> `data` - logical memory buffer to read/write to/from <br> `start_addr` - first logical address to read or write from when performing an operation on a portion of the memory; this is 0 if you are reading the full memory<br> `data_length` - how many logical words to read or write; this should be memory length if reading/writing entire memory. <br> `lookup_quanta` - omit for normal read or write operations; for accelerated operations assign to the macro of the same name<br> `lookup_tables` - omit for normal read or write operations; for accelerated operations assign to the macro of the same name <br> `u64_per_lookup` - omit for normal read or write operations; for accelerated operations assign to the macro of the same name <br> `tabsize` - omit for normal read or write operations; for accelerated operations assign to the macro of the same name <br> `pointer_to_trans_tables` - omit for normal read or write operations; for accelerated operations this is the translation table |
|  XFpga * | XFpgaInstance | Pointer to xilfpga object initialized by `readback_Init` |

#### Returns
0 on success\
int other than 0 on failure
