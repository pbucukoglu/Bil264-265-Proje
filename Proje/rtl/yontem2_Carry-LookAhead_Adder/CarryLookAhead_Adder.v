`timescale 1ns / 1ps

module CarryLookAhead_Adder #(parameter N = 8)
    (
        input [N-1:0] num1,
        input [N-1:0] num2,
        output [N:0] result
    );
    
    wire [N-1:0] G, P;
    wire [N:0] carry_out;
    assign carry_out[0] = 0;
    
    genvar i;
    generate
        for(i = 0; i < N; i = i+1) begin
            FullAdder FA1(.a(num1[i]), .b(num2[i]) , .c(carry_out[i]) ,.S(result[i]));
            
            assign G[i]   = num1[i] & num2[i];
            assign P[i]   = num1[i] | num2[i];
            assign carry_out[i+1] = (G[i] | (P[i] & carry_out[i]));
        end
    endgenerate
    
    assign result[N] = carry_out[N];
endmodule
