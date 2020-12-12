`default_nettype none

module m21(input wire logic sel, input wire logic[31:0] A, input wire logic[31:0] B, output logic[31:0] Q);
  assign Q = sel==0?A:B;
endmodule

module shleft(input wire logic[3:0] shamt, input wire logic[15:0] shin, output logic[31:0] shout);

  logic[31:0] shtmp, s0, s1, s2;
  
  assign shtmp = {{16{1'b0}}, shin};

  m21 M0 (shamt[0], shtmp, shtmp<<1, s0);
  m21 M1 (shamt[1], s0, s0<<2, s1);
  m21 M2 (shamt[2], s1, s1<<4, s2);
  m21 M3 (shamt[3], s2, s2<<8, shout);

endmodule