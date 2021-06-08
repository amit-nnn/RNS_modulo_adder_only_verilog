`timescale 1ns / 1ps
module modulo_9_tc_adder(a,b,sum);
    input [3:0]a,b;
    output [3:0]sum;
    wire [8:1]a1,b1,r1;
    Binary_to_9_TC b9tca(a,a1);
    Binary_to_9_TC b9tcb(b,b1);
    TC_9_modulo_adder tc9ma(a1,b1,r1);
    TC_9_to_binary tc9b(r1,sum);
endmodule
