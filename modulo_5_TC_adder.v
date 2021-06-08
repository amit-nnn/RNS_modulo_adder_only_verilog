`timescale 1ns / 1ps
module modulo_5_TC_adder(a,b,sum);
    input [2:0]a,b;
    output [2:0]sum;
    wire [4:1]a1,b1,r1;
    Binary_to_5_TC b5tca(a,a1);
    Binary_to_5_TC b5tcb(b,b1);
    tc_5_modulo_adder tc5ma(a1,b1,r1);
    TC_5_to_binary tc5b(r1,sum);
endmodule
