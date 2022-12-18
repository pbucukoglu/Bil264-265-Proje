`timescale 1ns / 1ps

module tb_CarryLookAhead_Adder;
    reg [7:0]num1;
    reg [7:0]num2;
    wire [8:0]result;
    
    CarryLookAhead_Adder #(.N(8)) RCA1 (.num1(num1), .num2(num2), .result(result));
    
    // random tests for parameter 8
    initial begin
        num1 = 8'b0000_0000; num2 = 8'b0000_0000; #5;
        num1 = 8'b1111_1111; num2 = 8'b1111_1111; #5;
        num1 = 8'b1111_1111; num2 = 8'b0000_0000; #5;
        num1 = 8'b0000_0000; num2 = 8'b1111_1111; #5;
        
        num1 = 8'b0000_1111; num2 = 8'b1111_0000; #5;
        num1 = 8'b0000_1111; num2 = 8'b0000_1111; #5;
        num1 = 8'b1111_0000; num2 = 8'b0000_1111; #5;
        num1 = 8'b1111_0000; num2 = 8'b1111_0000; #5;
        
        num1 = 8'b0110_0011; num2 = 8'b1000_0010; #5;
        num1 = 8'b0011_0111; num2 = 8'b0100_0011; #5;
        num1 = 8'b1100_0100; num2 = 8'b0000_0011; #5;
        num1 = 8'b0000_0010; num2 = 8'b1101_0001; #5;
        
        num1 = 8'b0111_1110; num2 = 8'b1000_0001; #5;
        num1 = 8'b0111_1100; num2 = 8'b0100_0101; #5;
        num1 = 8'b0011_1000; num2 = 8'b0000_1111; #5;
        num1 = 8'b1111_1100; num2 = 8'b0011_1100; #5;
    end
endmodule
