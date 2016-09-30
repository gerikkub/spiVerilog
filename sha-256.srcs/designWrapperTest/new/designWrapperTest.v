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


module designWrapperTest (
    );


    reg clock = 'd0;
    reg sclk = 'd0;
    reg mosi = 'd0;
    reg reset = 'd0;
    reg cs = 'd1;

    wire miso;

    designWrapper dw (
        .CLK100MHZ(clock),
        .sclk(sclk),
        .miso(miso),
        .mosi(mosi),
        .cs(cs),
        .reset(reset)
    );

    always
    begin
        #2
        clock = 'd0;
        #2
        clock = 'd1;
    end

    task send_byte;
        input [7:0]dataToSend;
        begin

            // Send first byte
            mosi = dataToSend[7];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[6];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[5];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[4];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[3];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[2];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[1];
            sclk = 'd1;
            #10
            sclk = 'd0;
            #10

            mosi = dataToSend[0];
            sclk = 'd1;
            #10
            sclk = 'd0;
        end
    endtask

    task send_allReg;
        input [7:0]byte1;
        input [7:0]byte2;
        input [7:0]byte3;
        input [7:0]byte4;
        input [7:0]byte5;
        input [7:0]byte6;
        input [7:0]byte7;
        input [7:0]byte8;
        input [7:0]byte9;
        input [7:0]byte10;
        begin
            send_byte(byte1);
            #10
            send_byte(byte2);
            #10
            send_byte(byte3);
            #10
            send_byte(byte4);
            #10
            send_byte(byte5);
            #10
            send_byte(byte6);
            #10
            send_byte(byte7);
            #10
            send_byte(byte8);
            #10
            send_byte(byte9);
            #10
            send_byte(byte10);
        end
    endtask

    task send_readReg;
        input [7:0]byte1;
        input [7:0]byte2;
        input [7:0]byte3;
        input [7:0]byte4;
        input [7:0]byte5;
        begin
            send_byte(byte1);
            #10
            send_byte(byte2);
            #10
            send_byte(byte3);
            #10
            send_byte(byte4);
            #10
            send_byte(byte5);
        end
    endtask

    task send_partReg;
        input [7:0]byte1;
        input [7:0]byte2;
        input [7:0]byte3;
        input [7:0]byte4;
        input [7:0]byte5;
        input [7:0]byte6;
        input [7:0]byte7;
        begin
            send_byte(byte1);
            #10
            send_byte(byte2);
            #10
            send_byte(byte3);
            #10
            send_byte(byte4);
            #10
            send_byte(byte5);
            #10
            send_byte(byte6);
            #10
            send_byte(byte7);
        end
    endtask


    initial begin
        #10
        // Reset Module
        reset = 'd0;
        #10
        sclk = 'd1;
        #10
        sclk = 'd0;
        #10

        // Set CS low
        cs = 'd0;
        reset = 'd1;

        #10

        send_allReg('d1, 'd2, 'd3, 'd4, 'd5, 'd6, 'd7, 'd8, 'd9, 'd10);

        #30
        cs = 'd1;
        #10
        cs = 'd0;
        #10

        send_allReg('d11, 'd12, 'd13, 'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20);

        #30
        cs = 'd1;
        #10

        send_allReg('d11, 'd12, 'd13, 'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20);

        #30
        cs = 'd0;
        #10

        send_readReg('d0, 'd0, 'd0, 'd0, 'd0);

        #30
        cs = 'd1;
        #10
        cs = 'd0;
        #10

        send_partReg('d11, 'd12, 'd13, 'd14, 'd15, 'd16, 'd17);

        #30
        cs = 'd1;
        #10
        cs = 'd0;
        #10

        send_allReg('d11, 'd12, 'd13, 'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20);
        
        #30
        cs = 'd1;
        #10

        $finish;

    end

    endmodule

