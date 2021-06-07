`timescale 1ns / 1ps
module TC_11_modulo_adder(a,b,remainder);
    input [10:1]a,b;
    output [10:1]remainder;

    wire [20:1]stage1;
    wire [10:1]stage2;
    wire sel,T0,T1,T2,T3,T4,T5,T6,T7,T8,T9;
    wire [9:1]stage3;
    wire [8:1]stage4;
    wire [7:1]stage5;
    wire [6:1]stage6;
    wire [5:1]stage7;
    wire [4:1]stage8;
    wire [3:1]stage9;
    wire [2:1]stage10;
    wire [10:1]sum0,sum1;
    parameter GND =1'b0;

    assign stage1[20] = ~(a[10] | b[1]);
    assign stage1[19] =  (a[10] & b[1]);
    assign stage1[18] = ~(a[9] | b[2]);
    assign stage1[17] =  (a[9] & b[2]);
    assign stage1[16] = ~(a[8] | b[3]);
    assign stage1[15] =  (a[8] & b[3]);
    assign stage1[14] = ~(a[7] | b[4]);
    assign stage1[13] =  (a[7] & b[4]);    
    assign stage1[12] = ~(a[6] | b[5]);
    assign stage1[11] =  (a[6] & b[5]);
    assign stage1[10] = ~(a[5] | b[6]);
    assign stage1[9]  =  (a[5] & b[6]);
    assign stage1[8]  = ~(a[4] | b[7]);
    assign stage1[7]  =  (a[4] & b[7]);
    assign stage1[6]  = ~(a[3] | b[8]);
    assign stage1[5]  =  (a[3] & b[8]);
    assign stage1[4]  = ~(a[2] | b[9]);
    assign stage1[3]  =  (a[2] & b[9]);
    assign stage1[2]  = ~(a[1] | b[10]);
    assign stage1[1]  =  (a[1] & b[10]);

    assign T0 = ~(stage1[20] | stage1[18] | stage1[16] | stage1[14] | stage1[12] | stage1[10] | stage1[8] | stage1[6] | stage1[4] | stage1[2]);
    assign sel  = ~(stage1[19] | stage1[17] | stage1[15] | stage1[13] | stage1[11] | stage1[9]  | stage1[7] | stage1[5] | stage1[3] | stage1[1]);
    

    assign stage2[10] = (stage1[20] | stage1[19]);
    assign stage2[9] = (stage1[18] | stage1[17]);
    assign stage2[8] = (stage1[16] | stage1[15]);
    assign stage2[7] = (stage1[14] | stage1[13]);
    assign stage2[6] = (stage1[12] | stage1[11]);
    assign stage2[5] = (stage1[10] | stage1[9]);
    assign stage2[4] = (stage1[8] | stage1[7]);
    assign stage2[3] = (stage1[6] | stage1[5]);
    assign stage2[2] = (stage1[4] | stage1[3]);
    assign stage2[1] = (stage1[2] | stage1[1]);

    assign stage3[9] = (stage2[10] & stage2[9]);
    assign stage3[8] = (stage2[9] & stage2[8]);
    assign stage3[7] = (stage2[8] & stage2[7]);
    assign stage3[6] = (stage2[7] & stage2[6]);
    assign stage3[5] = (stage2[6] & stage2[5]);
    assign stage3[4] = (stage2[5] & stage2[4]);
    assign stage3[3] = (stage2[4] & stage2[3]);
    assign stage3[2] = (stage2[3] & stage2[2]);
    assign stage3[1] = (stage2[2] & stage2[1]);

    assign T1 = ~(stage3[9] | stage3[8] | stage3[7] | stage3[6] | stage3[5] | stage3[4] | stage3[3] | stage3[2] | stage3[1]);


    assign stage4[8] = (stage3[9] & stage3[8]);
    assign stage4[7] = (stage3[8] & stage3[7]);
    assign stage4[6] = (stage3[7] & stage3[6]);
    assign stage4[5] = (stage3[6] & stage3[5]);
    assign stage4[4] = (stage3[5] & stage3[4]);
    assign stage4[3] = (stage3[4] & stage3[3]);
    assign stage4[2] = (stage3[3] & stage3[2]);
    assign stage4[1] = (stage3[2] & stage3[1]);
    
    assign T2 = ~(stage4[8] | stage4[7] | stage4[6] | stage4[5] | stage4[4] | stage4[3] | stage4[2] | stage4[1]);


    assign stage5[7] = (stage4[8] & stage4[7]);
    assign stage5[6] = (stage4[7] & stage4[6]);
    assign stage5[5] = (stage4[6] & stage4[5]);
    assign stage5[4] = (stage4[5] & stage4[4]);
    assign stage5[3] = (stage4[4] & stage4[3]);
    assign stage5[2] = (stage4[3] & stage4[2]);
    assign stage5[1] = (stage4[2] & stage4[1]);

    assign T3 = ~(stage5[7] | stage5[6] | stage5[5] | stage5[4] | stage5[3] | stage5[2] | stage5[1]);


    assign stage6[6] = (stage5[7] & stage5[6]);
    assign stage6[5] = (stage5[6] & stage5[5]);
    assign stage6[4] = (stage5[5] & stage5[4]);
    assign stage6[3] = (stage5[4] & stage5[3]);
    assign stage6[2] = (stage5[3] & stage5[2]);
    assign stage6[1] = (stage5[2] & stage5[1]);

    assign T4 = ~(stage6[6] | stage6[5] | stage6[4] | stage6[3] | stage6[2] | stage6[1]);


    assign stage7[5] = (stage6[6] & stage6[5]);
    assign stage7[4] = (stage6[5] & stage6[4]);
    assign stage7[3] = (stage6[4] & stage6[3]);
    assign stage7[2] = (stage6[3] & stage6[2]);
    assign stage7[1] = (stage6[2] & stage6[1]);

    assign T5 = ~(stage7[5] | stage7[4] | stage7[3] | stage7[2] | stage7[1]);

    
    assign stage8[4] = (stage7[5] & stage7[4]);
    assign stage8[3] = (stage7[4] & stage7[3]);
    assign stage8[2] = (stage7[3] & stage7[2]);
    assign stage8[1] = (stage7[2] & stage7[1]);

    assign T6 = ~(stage8[4] | stage8[3] | stage8[2] | stage8[1]);


    assign stage9[3] = (stage8[4] & stage8[3]);
    assign stage9[2] = (stage8[3] & stage8[2]);
    assign stage9[1] = (stage8[2] & stage8[1]);

    assign T7 = ~(stage9[3] | stage9[2] | stage9[1]);


    assign stage10[2] = (stage9[3] & stage9[2]);
    assign stage10[1] = (stage9[2] & stage9[1]);

    assign T8 = ~(stage10[2] | stage10[1]);

    assign T9 = ~(stage10[2] & stage10[1]);


    assign sum0[1] = T9;
    assign sum0[2] = T8;
    assign sum0[3] = T7;
    assign sum0[4] = T6;
    assign sum0[5] = T5;
    assign sum0[6] = T4;
    assign sum0[7] = T3;
    assign sum0[8] = T2;
    assign sum0[9] = T1;
    assign sum0[10] = T0;

    assign sum1[1] = ~T1;
    assign sum1[2] = ~T2;
    assign sum1[3] = ~T3;
    assign sum1[4] = ~T4;
    assign sum1[5] = ~T5;
    assign sum1[6] = ~T6;
    assign sum1[7] = ~T7;
    assign sum1[8] = ~T8;
    assign sum1[9] = ~T9;
    assign sum1[10] = GND;

    assign remainder[9:1] = sel?sum0[9:1]:sum1[9:1];
    assign remainder[10] = (T0 & sel);

endmodule
