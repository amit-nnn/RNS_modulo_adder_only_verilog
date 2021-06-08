`timescale 1ns / 1ps
module modulo_7_OHC_adder(a,b,sum);
    input [3:1]a,b;
    output [3:1]sum;
    wire [6:0]a1,b1,r1;
    binary_to_7_OHC b7ohca(a,a1);
    binary_to_7_OHC b7ohcb(b,b1);
    ohc_7_modulo_adder ohc7ma(a1,b1,r1);
    OHC_7_to_binary ohc7b(r1,sum);
endmodule
