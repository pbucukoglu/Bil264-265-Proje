`timescale 1ns / 1ps

module RippleCarry_Adder #(parameter N = 8)
    (
        input [N-1:0]num1,
        input [N-1:0]num2,
        output [N:0]result
    );
    
    wire [N:0]carry_out;
    assign carry_out[0] = 1'b0;
    
    genvar i;
    generate
        for(i = 0; i < N; i = i+1) begin
            FullAdder FA(.a(num1[i]), .b(num2[i]), .c(carry_out[i]), .S(result[i]), .C(carry_out[i+1]));
        end
    endgenerate
    
    assign result[N] = carry_out[N];
endmodule
