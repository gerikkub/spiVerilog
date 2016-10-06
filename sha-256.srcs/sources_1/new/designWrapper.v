`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2016 04:57:55 PM
// Design Name: 
// Module Name: designWrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module designWrapper(
    input CLK100MHZ,
    input sclk,
    output miso,
    input mosi,
    input cs,
    input reset,
    output [3:0]bitCount,
    output slowClkWire,
    output resOut
    );
    
    wire [7:0]spiInputData;
    wire [7:0]spiOutputData;
    wire registerValid;
    wire regFileWrite;
    wire [6:0]regFileNum;

    reg [6:0]regBNum = 'd0;
    wire [7:0]regBOut;

    reg slowClk = 'd0;
    reg [15:0]slowClkCounter = 'd0;

    assign slowClkWire = slowClk;
    assign resOut = reset;
    
    spiHw spi (
        .clk(slowClk),
        //.clk(CLK100MHZ),
        .reset(reset),
        .sclk(sclk),
        .miso(miso),
        .mosi(mosi),
        .cs(cs),
        .inData(spiInputData),
        .outData(spiOutputData),
        .valid(registersValid),
        .writeReg(regFileWrite),
        .regNum(regFileNum),
        .bitCount(bitCount)
    );

    regFile regFile (
        .clk(slowClk),
        //.clk(CLK100MHZ),
        .reset(reset),
        .regANum(regFileNum),
        .regAOut(spiInputData),
        .writeA(regFileWrite),
        .inA(spiOutputData),
        .regBNum(regBNum),
        .regBOut(regBOut)
    );

    
    always @(posedge CLK100MHZ)
    begin
        slowClkCounter = slowClkCounter + 'd1;

        if (slowClkCounter > 'd50)
        begin
            slowClk = ~slowClk;
            slowClkCounter = 'd0;
        end
    end
   

endmodule
