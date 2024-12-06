`timescale 1ns / 1ps

module ps2_keyboard (
    input clk,                 // System clock
    input PS2Clk,             // PS2 clock signal
    input PS2Data,            // PS2 data signal
    output reg [7:0] key_code, // 8-bit scan code of the pressed key
    output reg key_pressed     // Signal to indicate a key press
);

    reg [10:0] shift_reg;       // Shift register for PS/2 frame (start, 8 data bits, parity, stop)
    reg [3:0] bit_count;        // Bit counter
    reg prev_ps2_clk;           // Previous state of PS2 clock (for edge detection)

    // States for PS/2 protocol
    localparam IDLE = 0, RECEIVE = 1, DONE = 2;
    reg [1:0] state;

    always @(posedge clk) begin
        // Detect falling edge of ps2_clk
        if (prev_ps2_clk && ~PS2Clk) begin
            case (state)
                IDLE: begin
                    if (~PS2Data) begin // Start bit detected
                        state <= RECEIVE;
                        bit_count <= 0;
                    end
                end
                RECEIVE: begin
                    shift_reg <= {PS2Data, shift_reg[10:1]};
                    bit_count <= bit_count + 1;
                    if (bit_count == 10) begin // All bits received
                        state <= DONE;
                    end
                end
                DONE: begin
                    if (shift_reg[0] == 0 && shift_reg[10] == 1) begin // Valid frame
                        key_code <= shift_reg[8:1]; // Extract data bits
                        key_pressed <= 1;          // Indicate key press
                    end
                    state <= IDLE;
                end
            endcase
        end else begin
            key_pressed <= 0; // Reset key press signal
        end
        prev_ps2_clk <= PS2Clk;
    end
endmodule


