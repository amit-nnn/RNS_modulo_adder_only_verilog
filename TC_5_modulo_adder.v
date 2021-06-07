`timescale 1ns / 1ps
module tc_5_modulo_adder(a,b,remainder);
    input [4:1]a,b;
    output[4:1]remainder;

    wire [8:1]stage1;
    wire [4:1]stage2;
    wire sel,T0,T1,T2,T3;
    wire [3:1]stage3;
    wire [2:1]stage4;
    wire [4:1]sum0,sum1;

    parameter GND = 1'b0;

    assign stage1[8] = ~(a[4] | b[1]);
    assign stage1[7] =  (a[4] & b[1]);
    assign stage1[6] = ~(a[3] | b[2]);
    assign stage1[5] =  (a[3] & b[2]);
    assign stage1[4] = ~(a[2] | b[3]);
    assign stage1[3] =  (a[2] & b[3]);
    assign stage1[2] = ~(a[1] | b[4]);
    assign stage1[1] =  (a[1] & b[4]);

    assign T0 = ~(stage1[8] | stage1[6] | stage1[4] | stage1[2]);
    assign sel= ~(stage1[7] | stage1[5] | stage1[3] | stage1[1]);

    assign stage2[4] = (stage1[8] | stage1[7]);
    assign stage2[3] = (stage1[6] | stage1[5]);
    assign stage2[2] = (stage1[4] | stage1[3]);
    assign stage2[1] = (stage1[2] | stage1[1]);

    assign stage3[3] = (stage2[4] & stage2[3]);
    assign stage3[2] = (stage2[3] & stage2[2]);
    assign stage3[1] = (stage2[2] & stage2[1]);

    assign T1 = ~(stage3[3] | stage3[2] | stage3[1]);


    assign stage4[2] = (stage3[3] & stage3[2]);
    assign stage4[1] = (stage3[2] & stage3[1]);

    assign T2 = ~(stage4[2] | stage4[1]);
    assign T3 = ~(stage3[2] & stage3[1]);

    assign sum0[1] = T3;
    assign sum0[2] = T2;
    assign sum0[3] = T1;
    assign sum0[4] = T0;

    assign sum1[1] = ~T1;
    assign sum1[2] = ~T2;
    assign sum1[3] = ~T3;
    assign sum1[4] = GND;

    assign remainder[3:1] = sel?sum0[3:1]:sum1[3:1];
    assign remainder[4] = (T0 & sel);

endmodule
