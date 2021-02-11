/***************************************************************
* File: consume.sv
* Date: 13 July 2020
* Description: Write 16-bit words into a memory from handshaking.
****************************************************************/

`default_nettype none
module consume(
    input wire logic clk,
    input wire logic clrPCE,

    input wire logic rdyIn,
    output logic rdyOut,
    input wire logic[15:0] codeIn,

    input wire logic[9:0] psResultsAddr, 
    output logic[31:0] psResultsDout 
    );

    localparam TEXTLEN = 1024;
    
    logic incCnt, clrCnt, memWE, memWriteCnt;
    logic[9:0] cnt;
    logic[15:0] results;

    
    (* dont_touch = "true" *) (* ram_style = "block" *)   logic[15:0] resultsMem[TEXTLEN];

    typedef enum logic[1:0] {A, B, ERR='X} stateType;
    stateType ns, cs;

    assign psResultsDout = {16'd0, results};

    always_comb begin
        ns = ERR;
        rdyOut = 0;
        clrCnt = 0;        
        incCnt = 0;
        memWE = 0;
        memWriteCnt = 0;

        if (clrPCE) begin
            ns = A;
            clrCnt = 1;
        end 
        else begin
            case (cs)
                A:  begin
                    rdyOut = 1;
                    if (rdyIn) begin
                        ns = B;
                        memWE = 1;
                        incCnt = 1;
                    end
                    else
                        ns = A;
                end
                B:  begin
                        memWriteCnt = 1;
                        if (~rdyIn)
                            ns = A;
                        else
                            ns = B;
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

    // The output memory
    
    // The actual memory logic
    always_ff @(posedge clk) begin
        results <= resultsMem[psResultsAddr];    // This is a word addressable memories, not byte addressable.
        if (memWE)
            resultsMem[cnt+1] <= codeIn;
        //else if (memWriteCnt)
            //resultsMem[0] <= cnt;       // Location 0 will contain result count
    end

    
endmodule