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
    output [7:0] data_fk,
    output en
    );
    
    reg en, last_rec;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire sent, received, baud;
    wire [7:0] data_fk;
    
    assign data_fk = data_in;
    
    baudrate_gen baudrate_gen(clk, baud);
    uart_rx receiver(baud, RsRx, received, data_out);
    uart_tx transmitter(baud, data_in, en, sent, RsTx);
    
    always @(posedge baud) begin
        if (en) en = 0;
        if (~last_rec & received) begin
            //data_in = data_out + 8'h01;
            data_in = data_out;
            //8'h system
            //41 = A
            //30 = 0
            //ISO-8859-11 kor khai A1
            if ( 8'h00 <= data_in && data_in <= 8'hFF) en = 1;
            //if(data_in==8'hE0 ||data_in==8'hB8||data_in==8'h81) en = 1;//UTF-8 kor khai
        end
        last_rec = received;
    end
    
endmodule
