`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2016 04:29:20 PM
// Design Name: 
// Module Name: regFile
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


module regFile(
    input clk,
    input reset,
    input [6:0] regANum,
    output [7:0] regAOut,
    input writeA,
    input [7:0] inA,
    input [6:0] regBNum,
    output [7:0] regBOut
    );

    reg [7:0]registers[9:0] = {'d0, 'd0, 'd0, 'd0, 'd0, 'd0, 'd0, 'd0, 'd0, 'd0};

    reg [7:0]regAOutReg = 'd0;
    reg [7:0]regBOutReg = 'd0;

    assign regAOut = regAOutReg;
    assign regBOut = regBOutReg;

    always @(*)
    begin
        if (regANum >= 'd10)
        begin
            regAOutReg = 'd0;
        end else begin
            regAOutReg = registers[regANum];
        end

        if (regBNum >= 'd10)
        begin
            regBOutReg = 'd0;
        end else begin
            regBOutReg = registers[regBNum];
        end
    end

    integer i;

    always @(posedge clk)
    begin
        if (writeA == 'd1)
        begin
            registers[regANum] = inA;
        end

        if (reset == 'd0)
        begin
            for (i = 0; i < 10; i = i + 1)
            begin
                registers[i] = 'd0;
            end
        end
    end
    
endmodule
