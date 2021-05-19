#include <stdio.h>
#include "xil_printf.h"
#include "stdint.h"
#include "bert.h"
#include "xilfpga_extension.h"
#include "bzlib_private.h"
#include "mydesign.h"

// Word-length of logical memories for the results and histogram
#define HIST_LEN 256
#define RESULT_LEN 512

// Define print for embedded platform
#define PRINT xil_printf

// TO DEBUG: maybe need to get AXI reads to work under -O3
//#define VERBOSE_AXI 1
#undef VERBOSE_AXI

// Panic if bert_read does not succeed.
#define CHECK_ERR
//#undef CHECK_ERR

#ifdef CHECK_ERR
#define BERT_READ(X, Y, Z)                                                                               \
    switch (bert_read(X, Y, Z))                                                                          \
    {                                                                                                    \
    case BST_SUCCESS:                                                                                    \
        break;                                                                                           \
    case BST_NULL_PTR:                                                                                   \
        PRINT("ERROR: malloc for frame data returned NULL See tutorial on how to increase heap size\n"); \
        exit(1);                                                                                         \
    case BST_XILFPGA_FAILURE:                                                                            \
        PRINT("ERROR: xilfpga failure. See tutorial for how to deal with BST_XILFPGA_FAILURE\n");        \
        exit(1);                                                                                         \
    default:                                                                                             \
        PRINT("Bert returned an error code\n");                                                            \
        exit(1);                                                                                         \
    }
#else
#define BERT_READ bert_read
#endif

#ifdef CHECK_ERR
#define BERT_WRITE(X, Y, Z)                                                                              \
    switch (bert_write(X, Y, Z))                                                                         \
    {                                                                                                    \
    case BST_SUCCESS:                                                                                    \
        break;                                                                                           \
    case BST_NULL_PTR:                                                                                   \
        PRINT("ERROR: malloc for frame data returned NULL See tutorial on how to increase heap size\n"); \
        exit(1);                                                                                         \
    case BST_XILFPGA_FAILURE:                                                                            \
        PRINT("ERROR: xilfpga failure. See tutorial for how to deal with BST_XILFPGA_FAILURE\n");        \
        exit(1);                                                                                         \
    default:                                                                                             \
        PRINT("Bert returned an error code\n");                                                            \
        exit(1);                                                                                         \
    }
#else
#define BERT_WRITE bert_write
#endif

#define RESULTS_TO_PRINT 3

// Pointers to BRAMs exposed to AXI busses
unsigned int *raw = (unsigned int *)0xA0001000;
unsigned int *huff = (unsigned int *)0xA0003000;
unsigned int *hist = (unsigned int *)0xA0002000;
unsigned int *results = (unsigned int *)0xA0004000;
// Pointer to control register to reset Huffman encoder
unsigned int *huffRegs = (unsigned int *)0xA0000000;

uint64_t bert_results[1024];
uint64_t bert_hist[256];
uint64_t bert_huff[512];
uint64_t axi_hist[256];
uint64_t axi_results[1024];
uint64_t bert_raw[1024];

/*
* xilfpga object that needs to be initiliazed.
* Contains information about the device and pointers to functions that read/write bitstreams
*/
XFpga XFpgaInstance = {0U};

// Method that copies the state of memories over AXI into memory buffers
void extractAxi(int hlen, int rlen)
{
    PRINT("Read histogram through axi...\n");
    for (int i = 0; i < hlen; i++)
    {
#ifdef VERBOSE_AXI
        PRINT(".");
#endif
        axi_hist[i] = *(hist + i);
    }

    PRINT(" Read results through axi...\n");
    for (int i = 1; i <= rlen; i++)
    {
#ifdef VERBOSE_AXI
        PRINT(".");
#endif
        axi_results[i] = *(results + i);
    }
    PRINT("  finish extractAxi\n");
}

// Method that copies the state of memories using BERT into memory buffers
void extractBert(int raw, int hist, int result)
{
    // Clear just in case, remove later
    for (int i = 0; i < HIST_LEN; i++)
    {
        bert_hist[i] = 0;
    }
    for (int i = 0; i < RESULT_LEN; i++)
    {
        bert_results[i] = 0;
    }
    for (int i = 0; i < 1024; i++)
    {
        bert_raw[i] = 0;
    }
    BERT_READ(hist, bert_hist, &XFpgaInstance);
    BERT_READ(result, bert_results, &XFpgaInstance);
    BERT_READ(raw, bert_raw, &XFpgaInstance);
}

// For debugging state of Huffman encoder
void readRegs()
{
    for (int i = 0; i < 4; i++)
        PRINT("  Reg[%d] = %d\n", i, *(huffRegs + i));
}

// Reset the Huffman encoder. This means updating the results memory with a new encoding using the current input memory and Huffman table memory.
void clrHuff()
{
    PRINT("Resetting huffman...\n");
    *huffRegs = 1;
    *huffRegs = 0;
}

// This routine is overkill, huffman is always done when n=0 (obviously due to the time required for the PRINT)
// But, it may be done when n=0 even without the print, haven't tested that.
void waitHuff()
{
    PRINT("\nWaiting for done ");
    int n = 0;
    while (*(huffRegs + 1) == 0)
    {
        n++;
        if (n % 1000 == 0)
            PRINT(".");
        if (n > 100000)
        {
            PRINT("\n  Failed to get done, aborting.\n");
            return;
        }
    }
    PRINT("\n  Success, received done in %d tries\n", n);
}

/*
* Compares the read results from AXI and BERT to verify BERT is working.
* It also prints the number of values read as 0 to prevent false positives (like when both AXI and BERT read 0s on a failed BERT write).
*/
void compare(int hlen, int rlen)
{
    int histerr = 0;
    int resulterr = 0;
    int histzeros = 0;
    int resultzeros = 0;
    for (int i = 0; i < hlen; i++)
        if (axi_hist[i] != bert_hist[i])
        {
            PRINT("hist mismatch at %d axi=%llx bert=%llx\r\n", i, axi_hist[i], bert_hist[i]);
            histerr++;
        }
        else if (axi_hist[i] == 0)
        {
            //PRINT("axi and bert hist are 0 at %d\r\n", i);
            histzeros++;
        }
    for (int i = 0; i < rlen; i++)
        if (axi_results[i] != bert_results[i])
        {
            PRINT("result mismatch at %d axi=%llx bert=%llx\r\n", i, axi_results[i], bert_results[i]);
            resulterr++;
        }
        else if (axi_results[i] == 0)
        {
            //PRINT("axi and bert result are 0 at %d\r\n", i);
            resultzeros++;
        }
    if ((histerr + resulterr) == 0)
    {
        PRINT("SUCCESS: axi and bert match\n");
        PRINT("SUCCESS: hist entries that are zero: %d\n", histzeros);
        PRINT("SUCCESS: result entries that are zero: %d\n", resultzeros);
    }
    else
    {
        PRINT("FAIL: %d hist errors and %d result errors\n", histerr, resulterr);
    }
}

// Print the first n encodings for a sanity check
void print_results()
{
    for (int i = 0; i < RESULTS_TO_PRINT; i++)
    {
        xil_printf("result[%d] = %x\r\n", i, axi_results[i]);
    }
}

/*
* Compute a Huffman encoding table on the PS using the histogram memory read over BERT
* Assumes bert_read was already called on the histogram memory.
*/
void recompute_huffman(uint64_t *result_code)
{
    UChar len[256];
    Int32 code[256];

    BZ2_hbMakeCodeLengths(len, bert_hist, 256, 16);
    BZ2_hbAssignCodes(code, len, 1, 16, 256);
    // setup result_code;
    for (int i = 0; i < 256; i++)
    {
        // Bits [19:16] are the encoding length
        // Bits [15:0] are allocated to the encoding
        result_code[i] = (len[i] << 16) | code[i];
    }
}

int main()
{

    PRINT("Testing huffman with bert compressed\n");
    // Get indices of logical memories by name in hardware design
    int mem_input_slot = logical_memory_slot("design_1_i/top_0/inst/HUFFMAN/PRODUCER/inst/HUFFMAN/PRODUCER/rawTextMem", NUM_LOGICAL);
    int mem_huffman_slot = logical_memory_slot("design_1_i/top_0/inst/HUFFMAN/ENCODER/inst/HUFFMAN/ENCODER/huffmanMem", NUM_LOGICAL);
    int mem_hist_slot = logical_memory_slot("design_1_i/top_0/inst/HUFFMAN/ENCODER/HIST/histMem", NUM_LOGICAL);
    int mem_result_slot = logical_memory_slot("design_1_i/top_0/inst/HUFFMAN/CONSUMER/resultsMem", NUM_LOGICAL);

    PRINT("Memory indices: input=%d huffman=%d hist=%d result=%d\n", mem_input_slot, mem_huffman_slot, mem_hist_slot, mem_result_slot);
    if (mem_input_slot < 0)
    {
        PRINT("unable to find specified input slot\n");
        return -1;
    }
    if (mem_huffman_slot < 0)
    {
        PRINT("unable to find specified huffman encoder slot\n");
        return -1;
    }
    if (mem_hist_slot < 0)
    {
        PRINT("unable to find specified histogram slot\n");
        return -1;
    }
    if (mem_result_slot < 0)
    {
        PRINT("unable to find specified result slot\n");
        return -1;
    }
    readback_Init(&XFpgaInstance, PART_ID);

    uint64_t new_code[512];

    // On configuration, the huffman will run since it initializes to the init state
    // Check that that is the case (done should be high)
    waitHuff();

    /*
     * TEST 0. INITIAL READ OF LOGICAL MEMORIES
     */
    PRINT("\r\n0. INITIAL READ OF LOGICAL MEMORIES\r\n");
    // Read encoding results and histogram over AXI
    extractAxi(HIST_LEN, RESULT_LEN);
    // Read encoding results and histogram over BERT
    extractBert(mem_input_slot, mem_hist_slot, mem_result_slot);
    // Check that they agree
    compare(HIST_LEN, RESULT_LEN);
    print_results();

    /*
     * TEST 1. TEST WRITING NEW ENCODING TO HUFFMAN THROUGH BERT
     */
    PRINT("\r\n1. TEST WRITING NEW ENCODING TO HUFFMAN THROUGH BERT USING huffman.c\r\n");
    // Use the histogram reading from step 0 to compute a Huffman table on the PS
    recompute_huffman(new_code);
    // Write that encoding stored in int[] new_code to the embedded memory
    BERT_WRITE(mem_huffman_slot, new_code, &XFpgaInstance);
    // Reset the Huffman encoder so that it will use the new encodings
    clrHuff();
    waitHuff();
    // Read encoding results and histogram over AXI
    extractAxi(HIST_LEN, RESULT_LEN);
    // Read encoding results and histogram over BERT
    extractBert(mem_input_slot, mem_hist_slot, mem_result_slot);
    // Check that they agree
    compare(HIST_LEN, RESULT_LEN);
    print_results();

    /*
     * TEST 2. TEST WRITING IDENTITY ENCODING TO HUFFMAN THROUGH BERT
     *    TEST WRITING ASCENDING RAW INPUT
     */
    PRINT("\r\n2. TEST WRITING IDENTITY ENCODING TO HUFFMAN THROUGH BERT\r\n");
    PRINT("   TEST WRITING ASCENDING RAW INPUT\r\n");
    // Create an identity encoding and write ascending values to the input memory
    for (int i = 0; i < 512; i++)
    {
        char c = i % 256;
        // Encoding is the value itself. Encoding size is always 8b
        new_code[i] = (8 << 16) | (uint64_t)c;
        // Write char to memory. Raw input is twice as large as the histogram
        bert_raw[i] = (uint64_t)c;
        bert_raw[i + 512] = (uint64_t)c;
    }
    // Write that encoding stored in int[] new_code to the embedded memory
    BERT_WRITE(mem_huffman_slot, new_code, &XFpgaInstance);
    // Write the ascending input in int[] bert_raw to the embedded memory
    BERT_WRITE(mem_input_slot, bert_raw, &XFpgaInstance);
    // Reset the Huffman encoder so that it will use the new encodings
    clrHuff();
    waitHuff();
    // Read encoding results and histogram over AXI
    extractAxi(HIST_LEN, RESULT_LEN);
    // Read encoding results and histogram over BERT
    extractBert(mem_input_slot, mem_hist_slot, mem_result_slot);
    // Check that they agree
    compare(HIST_LEN, RESULT_LEN);
    // The results should be different now.
    print_results();

    return 0;
}
