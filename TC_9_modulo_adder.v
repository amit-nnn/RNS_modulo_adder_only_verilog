`timescale 1ns / 1ps
module TC_9_modulo_adder(a,b,remainder);
    input [8:1]a,b;
    output [8:1]remainder;

    wire [16:1]stage1;
    wire [8:1]stage2;
    wire sel,T0,T1,T2,T3,T4,T5,T6,T7;
    wire [7:1]stage3;
    wire [6:1]stage4;
    wire [5:1]stage5;
    wire [4:1]stage6;
    wire [3:1]stage7;
    wire [2:1]stage8;
    wire [8:1]sum0,sum1;

    parameter GND = 1'b0;

    assign stage1[16] = ~(a[8] | b[1]);
    assign stage1[15] =  (a[8] & b[1]);
    assign stage1[14] = ~(a[7] | b[2]);
    assign stage1[13] =  (a[7] & b[2]);
    assign stage1[12] = ~(a[6] | b[3]);
    assign stage1[11] =  (a[6] & b[3]);
    assign stage1[10] = ~(a[5] | b[4]);
    assign stage1[9]  =  (a[5] & b[4]);
    assign stage1[8]  = ~(a[4] | b[5]);
    assign stage1[7]  =  (a[4] & b[5]);
    assign stage1[6]  = ~(a[3] | b[6]);
    assign stage1[5]  =  (a[3] & b[6]);
    assign stage1[4]  = ~(a[2] | b[7]);
    assign stage1[3]  =  (a[2] & b[7]);
    assign stage1[2]  = ~(a[1] | b[8]);
    assign stage1[1]  =  (a[1] & b[8]);

    assign sel = ~(stage1[15] | stage1[13] | stage1[11] | stage1[9] | stage1[7] | stage1[5] | stage1[3] | stage1[1]);
    assign T0  = ~(stage1[16] | stage1[14] | stage1[12] | stage1[10] | stage1[8] | stage1[6] | stage1[4] | stage1[2]);

    assign stage2[8] = (stage1[16] | stage1[15]);
    assign stage2[7] = (stage1[14] | stage1[13]);
    assign stage2[6] = (stage1[12] | stage1[11]);
    assign stage2[5] = (stage1[10] | stage1[9]);
    assign stage2[4] = (stage1[8] | stage1[7]);
    assign stage2[3] = (stage1[6] | stage1[5]);
    assign stage2[2] = (stage1[4] | stage1[3]);
    assign stage2[1] = (stage1[2] | stage1[1 ]);
    
    assign stage3[7] = (stage2[8] & stage2[7]);
    assign stage3[6] = (stage2[7] & stage2[6]);
    assign stage3[5] = (stage2[6] & stage2[5]);
    assign stage3[4] = (stage2[5] & stage2[4]);
    assign stage3[3] = (stage2[4] & stage2[3]);
    assign stage3[2] = (stage2[3] & stage2[2]);
    assign stage3[1] = (stage2[2] & stage2[1]);
    
    assign T1 = ~(stage3[7] | stage3[6] | stage3[5] | stage3[4] | stage3[3] | stage3[2] | stage3[1]);


    assign stage4[6] = (stage3[7] & stage3[6]);
    assign stage4[5] = (stage3[6] & stage3[5]);
    assign stage4[4] = (stage3[5] & stage3[4]);
    assign stage4[3] = (stage3[4] & stage3[3]);
    assign stage4[2] = (stage3[3] & stage3[2]);
    assign stage4[1] = (stage3[2] & stage3[1]);
    
    assign T2 = ~(stage4[6] | stage4[5] | stage4[4] | stage4[3] | stage4[2] | stage4[1]);


    assign stage5[5] = (stage4[6] & stage4[5]);
    assign stage5[4] = (stage4[5] & stage4[4]);
    assign stage5[3] = (stage4[4] & stage4[3]);
    assign stage5[2] = (stage4[3] & stage4[2]);
    assign stage5[1] = (stage4[2] & stage4[1]);

    assign T3 = ~(stage5[5] | stage5[4] | stage5[3] | stage5[2] | stage5[1]);


    assign stage6[4] = (stage5[5] & stage5[4]);
    assign stage6[3] = (stage5[4] & stage5[3]);
    assign stage6[2] = (stage5[3] & stage5[2]);
    assign stage6[1] = (stage5[2] & stage5[1]);

    assign T4 = ~(stage6[4] | stage6[3] | stage6[2] | stage6[1]);

    assign stage7[3] = (stage6[4] & stage6[3]);
    assign stage7[2] = (stage6[3] & stage6[2]);
    assign stage7[1] = (stage6[2] & stage6[1]);

    assign T5 = ~(stage7[3] | stage7[2] | stage7[1]);

    assign stage8[2] = (stage7[3] & stage7[2]);
    assign stage8[1] = (stage7[2] & stage7[1]);

    assign T6 = ~(stage8[2] | stage8[1]);

    assign T7 = ~(stage8[2] & stage8[1]);

    assign sum0[1] = T7;
    assign sum0[2] = T6;
    assign sum0[3] = T5;
    assign sum0[4] = T4;
    assign sum0[5] = T3;
    assign sum0[6] = T2;
    assign sum0[7] = T1;
    assign sum0[8] = T0;

    assign sum1[1] = ~T1;
    assign sum1[2] = ~T2;
    assign sum1[3] = ~T3;
    assign sum1[4] = ~T4;
    assign sum1[5] = ~T5;
    assign sum1[6] = ~T6;
    assign sum1[7] = ~T7;
    assign sum1[8] = GND;

    assign remainder[7:1] = sel?sum0[7:1]:sum1[7:1];
    assign remainder[8] = (T0 & sel);

endmodule
