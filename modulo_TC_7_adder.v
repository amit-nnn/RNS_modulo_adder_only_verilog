`timescale 1ns / 1ps
module modulo_TC_7_adder(a,b,sum);
    input [2:0]a,b;
    output [2:0]sum;
    wire [6:1]a1,b1,r1;
    Binary_to_7_TC b7tca(a,a1);
    Binary_to_7_TC b7tcb(b,b1);
    tcr_7_modulo_adder tc7ma(a1,b1,r1);
    TC_7_to_binary tc7b(r1,sum);
endmodule
