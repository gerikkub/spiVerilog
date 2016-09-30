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


module regFileTest(
    );

    reg clock = 'd0;
    reg resetReg = 'd1;
    reg [6:0]regANumReg = 'd0;
    reg writeAReg = 'd0;
    reg [7:0]inAReg = 'd0;
    reg [6:0]regBNumReg = 'd0;

    wire [7:0]regAOut;
    wire [7:0]regBOut;

    regFile rf (
        .clk(clock),
        .reset(resetReg),
        .regANum(regANumReg),
        .regAOut(regAOut),
        .writeA(writeAReg),
        .inA(inAReg),
        .regBNum(regBNumReg),
        .regBOut(regBOut)
    );

    always
    begin
        #5 clock = ~clock;
    end
    
    task writeReg;
        input [6:0]regNum;
        input [7:0]data;
        begin
            regANumReg = regNum;
            inAReg = data;
            writeAReg = 'd1;
            #15
            writeAReg = 'd0;
        end
    endtask

    task sweepAReg;
        input dummy;
        begin
            regANumReg = 'd0;
            #10
            regANumReg = 'd1;
            #10
            regANumReg = 'd2;
            #10
            regANumReg = 'd3;
            #10
            regANumReg = 'd4;
            #10
            regANumReg = 'd5;
            #10
            regANumReg = 'd6;
            #10
            regANumReg = 'd7;
            #10
            regANumReg = 'd8;
            #10
            regANumReg = 'd9;
            #10
            regANumReg = 'd0;
        end
    endtask

    task sweepBReg;
        input dummy;
        begin
            regBNumReg = 'd0;
            #10
            regBNumReg = 'd1;
            #10
            regBNumReg = 'd2;
            #10
            regBNumReg = 'd3;
            #10
            regBNumReg = 'd4;
            #10
            regBNumReg = 'd5;
            #10
            regBNumReg = 'd6;
            #10
            regBNumReg = 'd7;
            #10
            regBNumReg = 'd8;
            #10
            regBNumReg = 'd9;
            #10
            regBNumReg = 'd0;
        end
    endtask

    initial
    begin
        resetReg = 'd0;
        #20
        resetReg = 'd1;
        #20

        sweepAReg('d0);
        sweepBReg('d0);

        writeReg('d0, 'hA0);
        #10
        writeReg('d1, 'hB1);
        #10
        writeReg('d2, 'hC2);
        #10
        writeReg('d3, 'hD3);
        #10
        writeReg('d4, 'hE4);
        #10
        writeReg('d5, 'hF5);
        #10
        writeReg('d6, 'h06);
        #10
        writeReg('d7, 'h17);
        #10
        writeReg('d8, 'h28);
        #10
        writeReg('d9, 'h39);
        #10

        sweepAReg('d0);
        sweepBReg('d0);

        #10

        resetReg = 'd0;
        #20
        resetReg = 'd1;
        #20

        sweepAReg('d0);
        sweepBReg('d0);

        $finish;
    end

endmodule

