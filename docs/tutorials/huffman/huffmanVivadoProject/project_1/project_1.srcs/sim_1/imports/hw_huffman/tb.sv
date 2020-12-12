`default_nettype none

module tb;
  logic clk, clr, done;
  logic[11:0] psResultsAddr;
  logic[31:0] psResultsDout;
  logic[11:0] psHistAddr;
  logic[31:0] psHistDout;
  logic psRawEna, psHuffEna;
  logic[3:0] psRawWE, psHuffWE;
  logic[11:0] psRawAddr, psHuffAddr;
  logic[31:0] psRawDin, psHuffDin;

  initial begin
    clk = 0;
    forever clk = #5ns ~clk;
  end

  top TOP(clk, clr, done, psResultsAddr, psResultsDout, psHistAddr, psHistDout, psRawEna, psRawWE, psRawAddr, psRawDin, psHuffEna, psHuffWE, psHuffAddr, psHuffDin);
  

  initial begin
    clr = 1;
    psResultsAddr = 4;
    psHistAddr = 0;
    psRawEna = 0;
    psHuffEna = 0;
    psRawWE = 0;
    psHuffWE = 0;
    psRawAddr = 0;
    psHuffAddr = 0;
    psRawDin = 0;
    psHuffDin = 0;
    
    repeat(3) @(negedge clk);
    
    
    clr = 0;


  end

endmodule