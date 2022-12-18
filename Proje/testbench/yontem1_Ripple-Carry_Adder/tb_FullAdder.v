`timescale 1ns / 1ps

module tb_FullAdder();
    reg a,b,c;
    wire S,C;
    
    FullAdder FA1(.a(a), .b(b), .c(c), .S(S), .C(C));
    
    // tb for all possible cases:
    initial begin
        a = 0;  b = 0;  c = 0;  #5;
        a = 0;  b = 0;  c = 1;  #5;
        a = 0;  b = 1;  c = 0;  #5;
        a = 0;  b = 1;  c = 1;  #5;
        
        a = 1;  b = 0;  c = 0;  #5;
        a = 1;  b = 0;  c = 1;  #5;
        a = 1;  b = 1;  c = 0;  #5;
        a = 1;  b = 1;  c = 1;  #5;
    end
endmodule
