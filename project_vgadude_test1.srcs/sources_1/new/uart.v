`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:14:31 AM
// Design Name: 
// Module Name: uart
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


module uart(
    input clk,
    input RsRx,
    output RsTx,
    output [7:0] data_out,
    output received
    //output reg [7:0] LEDs 
    );
    
    reg en, last_rec;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire sent, received, baud;
    
    baudrate_gen baudrate_gen(clk, baud);
    uart_rx receiver(baud, RsRx, received, data_out);
    uart_tx transmitter(baud, data_in, en, sent, RsTx);
    
    //325 clocks change, 1 baud changes
    always @(posedge baud) begin
        if (en) en = 0;
        if (~last_rec & received) begin // if received or pass enable
            en = 1;
        end
        last_rec = received;
    end
    
endmodule