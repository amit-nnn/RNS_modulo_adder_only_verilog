`timescale 1ns / 1ps
module modulo_9_OHC_adder(a,b,sum);
    input [4:1]a,b;
    output [4:1]sum;
    wire [9:1]a1,b1,r1;
    binary_to_9_OHC b9ohca(a,a1);
    binary_to_9_OHC b9ohcb(b,b1);
    ohc_9_modulo_adder ohc9ma(a1,b1,r1);
    OHC_9_to_binary ohc9b(r1,sum);
endmodule
