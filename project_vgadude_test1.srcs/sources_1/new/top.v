`timescale 1ns / 1ps

module top(
    input clk,              // 100MHz Basys 3
    input reset,            // sw[15]
    input set,              // btnC
    input [7:0] sw,         // sw[6:0] sets ASCII value
    input ja1,          // Receive from another board
    output ja2,         // Transmit to another board
    output wire RsTx, //uart
    input wire RsRx, //uart
    output hsync, vsync,    // VGA connector
    output [11:0] rgb       // DAC, VGA connector
    );
    
    // signals
    wire [9:0] w_x, w_y;
    wire w_vid_on, w_p_tick;
    reg [11:0] rgb_reg;
    wire [11:0] rgb_next;
    
    // instantiate vga controller
    vga_controller vga(.clk_100MHz(clk), .reset(reset), .video_on(w_vid_on),
                       .hsync(hsync), .vsync(vsync), .p_tick(w_p_tick), 
                       .x(w_x), .y(w_y));
    
    // instantiate text generation circuit
    text_screen_gen tsg(.clk(clk), .reset(reset), .video_on(w_vid_on), .set(set),
                        .up(up), .down(down), .left(left), .right(right),
                        .sw(sw), .x(w_x), .y(w_y), .rgb(rgb_next), .data_fk(data_fk), .en(en1));
                     
    wire [7:0] data_fk, data_waste;
    wire en1, en2;
     
    uart uartMyKeyboardToMyBasys(.clk(clk), .RsRx(ja1), .RsTx(RsTx), .data_in(0), .data_out(data_fk), .received(en1), .mode(1'b0));
    uart uartBoardToBoard(.clk(clk), .RsRx(RsRx), .RsTx(ja2), .data_in(sw[7:0]), .data_out(data_waste), .received(en2), .mode(set));
    
    // rgb buffer
    always @(posedge clk)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
    
endmodule