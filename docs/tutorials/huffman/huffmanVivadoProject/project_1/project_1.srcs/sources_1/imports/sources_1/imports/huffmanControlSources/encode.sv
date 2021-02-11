/***************************************************************
* File: encode.sv
* Date: 13 July 2020
* Description: given handshaking interfaces for input and for output, 
* will encode a stream of characters using a Huffman encoding.
* Is intended to be fed by a stream of 8-bit characters with handshaking.
* Handshakes with the consumer of its 16-bit word encoded data.
****************************************************************/

`default_nettype none
module encode(
    input wire logic clk,
    input wire logic clr,
    input wire logic clrHist,

    output wire histResetting,

    input wire logic rdyR,
    input wire logic rdyW,
    input wire logic[7:0] chIn,
    output logic readChar,

    output logic writeChar,
    output logic[15:0] codeOut,

    input wire logic[9:0] psHistAddr,
    output logic[31:0] psHistDout,

    input wire logic psHuffEna,
    input wire logic[3:0]  psHuffWE,
    input wire logic [9:0] psHuffAddr,
    input wire logic[31:0] psHuffDin
);

    logic ldCode, ldReg, addPtr, shift16, subPtr, clrPtr;
    logic[4:0] ptr;
    logic[19:0] code;        // Read from Huffman code memory
    logic[3:0] huffmanLen;   // Parts split off from it
    logic[15:0] huffmanCode;
    logic[31:0] shiftedCode;
    logic[15:0] histOut;

    logic[31:0] r;  // Register where we assemble the outgoing stream

    (* dont_touch = "true" *) (* ram_style = "block" *)   logic[19:0] huffmanMem[256];   // The memory where the codes are stored

    typedef enum logic[2:0] {A, LDCODE, B, C, D, ERR='X} stateType;
    stateType ns, cs;

    assign psHistDout = { 16'd0, histOut};

    always_comb begin
        ns = ERR;
        readChar = 0;
        ldCode = 0;
        ldReg = 0;
        addPtr = 0;
        shift16 = 0;
        subPtr = 0;
        writeChar = 0;
        clrPtr = 0;
        if (clr || histResetting) begin
            ns = A;
            clrPtr = 1;
        end 
        else begin
            case (cs)
                A: if (rdyR) begin
                    ns = B;
                    readChar = 1;
                    ldCode = 1;
                end
                else
                    ns = A;
                B:  begin
                    ldReg = 1;
                    addPtr = 1;
                    ns = C;
                end
                C: if (ptr < 16)
                    ns = A;
                else
                    ns = D;
                D: if (rdyW) begin
                    shift16 = 1;
                    subPtr = 1;
                    writeChar = 1;
                    ns = A;
                end
                else
                    ns = D;
            endcase

        end
    end // always_comb

    always_ff @(posedge clk)
        cs <= ns;

    // Split apart the incoming character
    assign huffmanLen = code[19:16];
    assign huffmanCode = code[15:0];

    // The ptr module
    always_ff @(posedge clk) begin
        if (clrPtr)
            ptr <= 0;
        else if (addPtr)
            ptr <= ptr + huffmanLen;
        else if (subPtr) 
            ptr <= ptr - 16;
    end

    // The register itself
    // Shift the code over
    shleft SHLEFT(ptr[3:0], huffmanCode, shiftedCode);
    always_ff @(posedge clk) begin
        if (clr | histResetting)
            r <= 0;
        else if (ldReg) 
            r <= shiftedCode | r;
        else if (shift16)
            r <= { {16{1'b0}}, r[31:16]};
    end

    // The output word to be written
    assign codeOut = r[15:0];

    // The actual Huffman memory where the codes are stored (it is a ROM)
    // Load it
    initial begin
        $readmemh("./huffman.init", huffmanMem);
    end
    
    // The actual memory logic
    always_ff @(posedge clk) begin
        if (ldCode)
            code <= huffmanMem[chIn];
        if (psHuffEna == 1 && psHuffWE != 0)
            huffmanMem[psHuffAddr] <= psHuffDin;
    end
        
            
    // The histogram calculator
    histogram HIST(clk, clrHist, ldCode, chIn, histResetting, psHistAddr[7:0], histOut);
            
endmodule
