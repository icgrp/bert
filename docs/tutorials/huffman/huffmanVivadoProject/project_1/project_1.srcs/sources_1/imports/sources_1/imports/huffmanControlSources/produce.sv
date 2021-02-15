/***************************************************************
* File: produce.sv
* Date: 13 July 2020
* Description: read characters from a memory and send on using handshaking.
****************************************************************/

`default_nettype none
module produce(
    input wire logic clk,
    input wire logic clrPCE,
    output logic pDone,

    input wire logic rdyIn,
    output logic rdyOut,

    output logic[7:0] chOut,

    input wire logic psRawEna,
    input wire logic[3:0] psRawWE,
    input wire logic [9:0] psRawAddr,
    input wire logic[31:0] psRawDin
    );

    localparam TEXTLEN = 1024;
    
    logic incCnt, clrCnt, doRead;
    logic[9:0] cnt;
    
    (* dont_touch = "true" *) (* ram_style = "block" *)   logic[7:0] rawTextMem[TEXTLEN];

    typedef enum logic[1:0] {A, B, C, D, ERR='X} stateType;
    stateType ns, cs;

    always_comb begin
        ns = ERR;
        doRead = 0;
        clrCnt = 0;        
        incCnt = 0;
        rdyOut = 0; 
        pDone = 0;
        
        if (clrPCE) begin
            ns = A;
            clrCnt = 1;
        end 
        else begin
            case (cs)
                A: begin
                    ns = B;
                    doRead = 1;
                    incCnt = 1;
                end
                B:  begin
                    rdyOut = 1;
                    if (rdyIn && cnt != TEXTLEN-1)
                        ns = A;
                    else if (rdyIn && cnt == TEXTLEN-1)
                        ns = C;
                    else
                        ns = B;
                end
                C:  begin
                    pDone = 1;
                    ns = C;
                end
            endcase

        end
    end // always_comb

    always_ff @(posedge clk)
        cs <= ns;

    // The counter
    always_ff @(posedge clk) begin
        if (clrCnt)
            cnt <= 0;
        else if (incCnt)
            cnt <= cnt + 1;
    end

    // The text memory
    // Load it
    initial begin
        $readmemh("./inMem.init", rawTextMem);
    end
    
    // The actual memory logic
    always_ff @(posedge clk) begin
        if (doRead)
            chOut <= rawTextMem[cnt];
        if (psRawEna == 1 && psRawWE != 0)
            rawTextMem[psRawAddr] <= psRawDin;
    end

    
endmodule
