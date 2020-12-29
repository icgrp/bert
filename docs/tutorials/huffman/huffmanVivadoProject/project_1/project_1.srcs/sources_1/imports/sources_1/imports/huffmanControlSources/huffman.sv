
`default_nettype none

module huffman(
    input wire logic clk,
    input wire logic clr,
    output logic done,

    input wire logic[9:0] psResultsAddr,
    output logic[31:0] psResultsDout,
    input wire logic[9:0] psHistAddr,
    output logic[31:0] psHistDout,

    input wire psRawEna,
    input wire logic[3:0] psRawWE,
    input wire logic [9:0] psRawAddr,
    input wire logic[31:0] psRawDin,

    input wire logic psHuffEna,
    input wire logic[3:0] psHuffWE,
    input wire logic [9:0] psHuffAddr,
    input wire logic[31:0] psHuffDin
);

    logic prdyIn, prdyOut;
    logic crdyIn, crdyOut;
    logic[7:0] pchOut;
    logic[15:0] ccodeIn;
    logic histResetting;

    logic clrPCE, clrHist, clrDla;
    logic [4:0] dla;
    logic pDone;

    typedef enum logic [2:0] {histPrep, huffPrep, huffRun, huffDla, huffFinal, ERR='X} stateType;
    stateType ns, cs;
    
    always_ff @(posedge clk)
        cs <= ns;

    always_comb begin
        clrPCE = 0;
        clrHist = 0;
        done = 0;
        ns = ERR;
        clrDla = 1;

        if (clr) begin
            ns = histPrep;
            clrHist = 1;
        end
        else
        case (cs)
            histPrep: begin
                clrPCE = 1;
                if (~histResetting)
                    ns = huffPrep;
                else
                    ns = histPrep;
            end 
            huffPrep: begin
                //clrPCE = 1;
                //huffRdy = 1;
                //if (doHuff)
                    ns = huffRun;
                //else
                //    ns = huffPrep; 
            end 
            huffRun: begin
                if (pDone)
                    ns = huffDla;
                else
                    ns = huffRun;
            end 
            huffDla: begin
                clrDla = 0;
                if (&dla)
                    ns = huffFinal;
                else
                    ns = huffDla;
            end
            huffFinal: begin
                done = 1;
                ns = huffFinal;
            end
        endcase
    end

    produce PRODUCER(
        clk,
        clrPCE,
        pDone,

        prdyIn,
        prdyOut,

        pchOut,

        psRawEna,
        psRawWE,
        psRawAddr,
        psRawDin
        );

    encode ENCODER(
        clk,

        clrPCE,
        clrHist,
        histResetting,

        prdyOut,
        crdyOut,
        pchOut,
        prdyIn,

        crdyIn,
        ccodeIn,
        
        psHistAddr,
        psHistDout,

        psHuffEna,
        psHuffWE,
        psHuffAddr,
        psHuffDin
        );    

    consume CONSUMER(
        clk,
        clrPCE,

        crdyIn,
        crdyOut,
        ccodeIn,

        psResultsAddr,
        psResultsDout);

    always_ff @(posedge clk)
        if (clrDla)
            dla <= 0;
        else
            dla <= dla + 1;

    endmodule

