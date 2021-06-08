`timescale 1ns / 1ps
module modulo_11_TC_adder(a,b,sum);
    input [4:1]a,b;
    output [4:1]sum;
    wire [10:1]a1,b1,r1;
    Binary_to_11_TC b11tca(a,a1);
    Binary_to_11_TC b11tcb(b,b1);
    TC_11_modulo_adder tc11ma(a1,b1,r1);
    TC_11_to_binary tc11b(r1,sum);
endmodule
