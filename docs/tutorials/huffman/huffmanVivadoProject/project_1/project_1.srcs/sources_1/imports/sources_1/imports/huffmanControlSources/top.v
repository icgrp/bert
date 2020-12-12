// This module is needed because IP integrator cannot handle .sv files.  So we have to wrap huffman.sv in this file.

module top(
    input wire clk,
    input wire clr,
    output wire done,
    
    input wire[11:0] psResultsAddr,         // We get byte addresses from the PS
    output wire [31:0] psResultsDout,       // Down below we erase 2 LSB's so they
    input wire [11:0] psHistAddr,           //   become word addresses.
    output wire[31:0] psHistDout,
    input wire psRawEna,
    input wire [3:0] psRawWE,
    input wire [11:0] psRawAddr,
    input wire [31:0] psRawDin,
    input wire psHuffEna,
    input wire [3:0] psHuffWE,
    input wire [11:0] psHuffAddr,
    input wire[31:0] psHuffDin
);

    huffman HUFFMAN(clk, clr, done, psResultsAddr[11:2], psResultsDout, psHistAddr[11:2], psHistDout,
                    psRawEna, psRawWE, psRawAddr[11:2], psRawDin,
                    psHuffEna, psHuffWE, psHuffAddr[11:2], psHuffDin
                    );

endmodule
