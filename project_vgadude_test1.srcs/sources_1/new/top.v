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
    output [11:0] rgb,       // DAC, VGA connector
    output [6:0] seg,
    output dp,
    output [3:0] an
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
    
    // div clk for display
    wire [18:0] tclk;
    assign tclk[0] = clk;
    
    genvar c;
    generate for(c=0;c<18;c=c+1)
    begin
        clockDiv div(tclk[c+1], tclk[c]);
    end
    endgenerate
    
    clockDiv ffdiv(targetClk, tclk[18]);
    
    reg [7:0] display_out;
    
    always@(*) begin
        if(set) display_out = sw;
        else if(en2) display_out = data_waste; 
    end
    
    wire targetClk;
    wire an0,an1,an2,an3;

    assign an = {an3,an2,an1,an0};
    quadSevenSeg tdm(seg,dp,an0,an1,an2,an3, data_fk[3:0] , data_fk[7:4], display_out[3:0], display_out[7:4], targetClk);
    
    // rgb buffer
    always @(posedge clk)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
    
endmodule