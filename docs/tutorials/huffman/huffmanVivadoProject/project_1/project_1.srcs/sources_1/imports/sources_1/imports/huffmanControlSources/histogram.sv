`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 07/13/2020 12:46:38 PM
// Module Name: histogram
// Description: Simple histogram calculator.
//              Assume input character is valid when 'valid==1' and also then the cycle after.  Else will have to register it for write to BRAM.
//////////////////////////////////////////////////////////////////////////////////

module histogram(
    input wire logic clk, clr, valid,
    input wire logic [7:0] in,
    output logic resetting,
    input wire logic[7:0] psHistAddr,
    output logic [15:0] psHistDout
    );
    
    (* dont_touch = "true" *) (* ram_style = "block" *)  logic [15:0] histMem [256];

    
    typedef enum logic [1:0] {idle,write,init,ERR='X} stateType;
    stateType ns,cs;

    logic we, clearreg, clearcount, done;
    logic [7:0] count;
    logic [15:0] histOut;
    logic readHist;
    logic[7:0] histAddr; 

    logic memWE;
    logic [7:0] memAddr;
    logic [15:0] memDin;

    assign psHistDout = histOut;
    assign memWE = we | clearreg;
    assign memAddr = we?in:count;
    assign memDin = we?histOut+1:0;
    
    assign histAddr = readHist?in:psHistAddr;
    always_ff @(posedge clk) begin
        histOut <= histMem[histAddr];  
        if (memWE)
            histMem[memAddr] <= memDin;
    end
    
    always_ff @(posedge clk)
        cs <= ns;
        
    
    always_ff @(posedge clk)
        if (clearcount)
            count <= 0;
        else
            count <= count + 1;
            
    assign done = &count;
    assign resetting = (cs == init);
    
    always_comb begin
        we = 0;
        ns = ERR;
        clearreg = 0;
        clearcount = 0;
        readHist = 0;
        if (clr) begin
            clearcount = 1;
            ns = init;
        end
        else case (cs)
            init: begin
                clearreg = 1;
                if (done)
                    ns = idle;
                else
                    ns = init;
            end
            idle: begin
                clearcount = 1;
                if (valid) begin
                    ns = write; 
                    readHist = 1;
                end
                else
                    ns = idle;
            end 
            write: begin
                we = 1;
                clearcount = 1;
                ns = idle;
                readHist = 1;
            end 
        endcase
    end
    
    
endmodule
