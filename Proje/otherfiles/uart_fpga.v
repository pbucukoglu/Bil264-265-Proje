`timescale 1ns / 1ps

// Declare the module for the top-level design
module uart_fpga (
    input clk,
    input rst,
    input [1:0] state, // 2-bit state variable
    input [63:0] data_in1, // 8-bit data input
    input [63:0] data_in2, // 8-bit second input
    output reg [63:0] data_out, // 8-bit data output
    output reg tx, // UART transmit signal
    input rx // UART receive signal
);

// Declare a wire for storing the result of the adder
wire [8:0] result;

// Instantiate the four adder modules
RippleCarry_Adder #(.N(64)) rca(
    .num1(data_in1),
    .num2(data_in2),
    .result(result)
);

CarryLookAhead_Adder #(.N(64)) cla(
    .num1(data_in1),
    .num2(data_in2),
    .result(result)
);

Carry_Save_Adder #(.N(64)) csa(
    .num1(data_in1),
    .num2(data_in2),
    .num3(64'd0),
    .result(result)
);

// Use the state variable to select which adder module to use
always @(posedge clk) begin
    if (rst) begin
        data_out = 0;
        tx = 0;
    end 
    else begin
        case (state)
            2'b00: data_out <= rca.result;
            2'b01: data_out <= cla.result;
            2'b10: data_out <= csa.result;
            default: data_out <= 8'h0;
        endcase
    end
end
endmodule
