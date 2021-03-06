`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2016 08:04:11 PM
// Design Name: 
// Module Name: shiftRegisterTest
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


module shiftRegisterTest(

    );

    reg clock = 'd0;
    reg writeClk = 'd0;
    reg dataIn = 'd0;
    reg reset = 'd0;
    reg [7:0]pIn = 'd0;
    reg writeP = 'd0;
    wire [7:0]pOut;
    wire dataOut;

    shiftRegister sr (
        .clk(clock),
        .writeClk(writeClk),
        .dIn(dataIn),
        .reset(reset),
        .dOut(dataOut),
        .pIn(pIn),
        .writeP(writeP),
        .pOut(pOut)
        );

    initial
    begin
        // Reset shift register
        reset = 'd0;
        clock = 'd0;
        #10
        clock = 'd1;
        #10
        clock = 'd0;
        #5

        // Clock in pIn
        writeP = 'd1;
        #5
        reset = 'd1;
        pIn = 'hA5;
        clock = 'd1;
        #10
        clock = 'd0;
        #10
        writeClk = 'd1;
        #10
        writeClk = 'd0;
        #10
        writeP = 'd0;

        // Write in hex 0xCE

        // 7
        dataIn = 'd1;
        #10
        clock = 'd0;
        #10

        // 6
        clock = 'd1;
        dataIn = 'd1;
        #10
        clock = 'd0;
        #10

        // 5
        clock = 'd1;
        dataIn = 'd0;
        #10
        clock = 'd0;
        #10

        // 4
        clock = 'd1;
        dataIn = 'd0;
        #10
        clock = 'd0;
        #10
       
        // 3
        clock = 'd1;
        dataIn = 'd1;
        #10
        clock = 'd0;
        #10
       
        // 2
        clock = 'd1;
        dataIn = 'd1;
        #10
        clock = 'd0;
        #10
       
        //1
        clock = 'd1;
        dataIn = 'd1;
        #10
        clock = 'd0;
        #10
       
        // 0
        clock = 'd1;
        dataIn = 'd0;
        #10
        clock = 'd0;
        #10

        writeClk = 'd1;
        #10
        writeClk = 'd0;
        #10
       
        clock = 'd1;
        #10
        dataIn = 'd1;
        #10
        dataIn = 'd0;
        #10
        reset = 'd0;
        #10
        reset = 'd1;
        #10
        reset = 'd0;
        $finish;

    end


endmodule
