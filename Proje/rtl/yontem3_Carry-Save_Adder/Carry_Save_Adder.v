`timescale 1ns / 1ps

// 4-bit CarrySave adder
module Carry_Save_Adder #(parameter N = 8)(input [N-1:0] num1,num2,num3,
                                            output [N+1:0] result);
            
    wire [N:0] helperResult,c1,c2;

    assign c2[0] = 0;
    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin
            FullAdder fa1(.a(num1[i]) , .b(num2[i]), .c(num3[i]), .S(helperResult[i]), .C(c1[i]));
        end
    endgenerate
    
    generate
        for (j = 0; j < N - 1; j = j+1) begin
            FullAdder fa2(.a(helperResult[j+1]), .b(c1[j]), .c(c2[j]), . S(result[j+1]), .C(c2[j+1]));
        end
    endgenerate
    
    FullAdder fa3(0, c1[N-1], c2[N-1], result[N], result[N+1]);
    assign result[0] = helperResult[0];

endmodule
