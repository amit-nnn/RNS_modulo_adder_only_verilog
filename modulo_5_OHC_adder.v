`timescale 1ns / 1ps
module modulo_5_OHC_adder(a,b,sum);
    input [2:0]a,b;
    output [2:0]sum;
    wire [5:1]a1,b1,r1;
    binary_to_5_OHC b5ohca(a,a1);
    binary_to_5_OHC b5ohcb(b,b1);
    OHC_5_modulo_adder ohc5ma(a1,b1,r1);
    OHC_5_to_binary ohc5b(r1,sum);
endmodule
