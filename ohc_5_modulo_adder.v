`timescale 1ns / 1ps
module TC_5_modulo_adder(a,b,sum);

    input [4:0]a,b;
    output [4:0]sum;
    wire [10:1]stage1;
    wire [10:1]stage2;

    assign stage1[1] = (a[4] & b[4]);
    assign stage1[2] = (a[4] | b[4]);
    assign stage1[3] = (a[3] & b[3]);
    assign stage1[4] = (a[3] | b[3]);
    assign stage1[5] = (a[2] & b[2]);
    assign stage1[6] = (a[2] | b[2]);
    assign stage1[7] = (a[1] & b[1]);
    assign stage1[8] = (a[1] | b[1]);
    assign stage1[9] = (a[0] & b[0]);
    assign stage1[10]= (a[0] | b[0]);
    
    assign stage2[1] = (stage1[8] & stage1[2]);
    assign stage2[2] = (stage1[6] & stage1[4]);
    assign stage2[3] = (stage1[10]& stage1[8]);
    assign stage2[4] = (stage1[6] & stage1[2]);
    assign stage2[5] = (stage1[10]& stage1[6]);
    assign stage2[6] = (stage1[4] & stage1[2]);
    assign stage2[7] = (stage1[10]& stage1[4]);
    assign stage2[8] = (stage1[8] & stage1[6]);
    assign stage2[9] = (stage1[10]& stage1[2]);
    assign stage2[10]= (stage1[8] & stage1[4]);

    assign sum[0] = (stage1[9] | stage2[1] | stage2[2]);
    assign sum[1] = (stage1[3] | stage2[3] | stage2[4]);
    assign sum[2] = (stage1[7] | stage2[5] | stage2[6]);
    assign sum[3] = (stage1[1] | stage2[9] | stage2[8]);
    assign sum[4] = (stage1[5] | stage2[9] | stage2[10]);


endmodule
