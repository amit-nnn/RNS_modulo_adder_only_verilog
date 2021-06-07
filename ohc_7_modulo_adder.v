`timescale 1ns / 1ps
module ohc_7_modulo_adder(a,b,sum);
    input [6:0]a,b;
    output [6:0]sum;
    wire [14:1]stage1;
    wire [21:1]stage2;

    assign stage1[14] = (a[6] & b[6]);
    assign stage1[13] = (a[6] | b[6]);
    assign stage1[12] = (a[5] & b[5]);
    assign stage1[11] = (a[5] | b[5]);
    assign stage1[10] = (a[4] & b[4]);
    assign stage1[9]  = (a[4] | b[4]);
    assign stage1[8]  = (a[3] & b[3]);
    assign stage1[7]  = (a[3] | b[3]);
    assign stage1[6]  = (a[2] & b[2]);
    assign stage1[5]  = (a[2] | b[2]);
    assign stage1[4]  = (a[1] & b[1]);
    assign stage1[3]  = (a[1] | b[1]);
    assign stage1[2]  = (a[0] & b[0]);
    assign stage1[1]  = (a[0] | b[0]);

    assign stage2[21] = (stage1[3] & stage1[11]);
    assign stage2[20] = (stage1[5] & stage1[9]);
    assign stage2[19] = (stage1[1] & stage1[13]);
    assign stage2[18] = (stage1[3] & stage1[9]);
    assign stage2[17] = (stage1[5] & stage1[7]);
    assign stage2[16] = (stage1[1] & stage1[11]);
    assign stage2[15] = (stage1[7] & stage1[1]);
    assign stage2[14] = (stage1[11]& stage1[13]);
    assign stage2[13] = (stage1[1] & stage1[9]);
    assign stage2[12] = (stage1[3] & stage1[5]);
    assign stage2[11] = (stage1[9] & stage1[13]);
    assign stage2[10] = (stage1[1] & stage1[7]);
    assign stage2[9]  = (stage1[9] & stage1[11]);
    assign stage2[8]  = (stage1[7] & stage1[13]);
    assign stage2[7]  = (stage1[1] & stage1[5]);
    assign stage2[6]  = (stage1[7] & stage1[11]);
    assign stage2[5]  = (stage1[5] & stage1[13]);
    assign stage2[4]  = (stage1[1] & stage1[3]);
    assign stage2[3]  = (stage1[7] & stage1[9]);
    assign stage2[2]  = (stage1[5] & stage1[11]);
    assign stage2[1]  = (stage1[13]& stage1[3]);

    assign sum[6] = (stage2[21] | stage2[20] | stage2[19] | stage1[8]);
    assign sum[5] = (stage2[18] | stage2[17] | stage2[16] | stage1[14]);
    assign sum[4] = (stage2[15] | stage2[14] | stage2[13] | stage1[6]);
    assign sum[3] = (stage2[12] | stage2[11] | stage2[10] | stage1[12]);
    assign sum[2] = (stage2[9]  | stage2[8]  | stage2[7]  | stage1[4]);
    assign sum[1] = (stage2[6]  | stage2[5]  | stage2[4]  | stage1[10]);
    assign sum[0] = (stage2[3]  | stage2[2]  | stage2[1]  | stage1[2]);

endmodule
