`timescale 1ns / 1ps
module modulo_11_OHC_adder(a,b,sum);
    input [4:1]a,b;
    output [4:1]sum;
    wire [10:1]a1,b1,r1;
    binary_to_11_OHC b11ohca(a,a1);
    binary_to_11_OHC b11ohcb(b,b1);
    ohc_11_modulo_adder oa(a1,b1,r1);
    OHC_11_to_binary ohc11b(r1,sum);
endmodule
