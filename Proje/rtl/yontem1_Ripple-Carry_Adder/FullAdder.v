`timescale 1ns / 1ps

module FullAdder(input a,b,c, output S,C);
    wire w1,w2,w3;
    
    assign w1 = a ^ b;
    assign w2 = w1 & c;
    assign w3 = a & b;
    
    assign S = c ^ w1;
    assign C = w3 | w2;  
endmodule
