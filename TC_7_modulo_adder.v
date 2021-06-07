`timescale 1ns / 1ps
module tcr_7_modulo_adder(a,b,sum);

    //Declaration of inputs and outputs.

    input [6:1]a,b;
    output [6:1]sum;

    
    //declaration of intermidate wire that connect in between the circuit.

    wire [6:1] sum0,sum1;
    wire sel;
    wire [12:1]stage1;
    wire [5:0]stage2;
    wire [5:1]stage3;
    wire [4:1]stage4;
    wire [3:1]stage5;
    wire [2:1]stage6;

    
    //here we are declaring a parameter to use in the sum1 circuit.

    parameter GND = 1'b0;
    
    
    //logic 
    //here we are using reversed version of b input of thermometer coding.
    //then we are operating those inputs with NOR gate and AND gate.

    assign stage1[12] = ~(a[6] | b[1]);
    assign stage1[11] = ~(a[5] | b[2]);
    assign stage1[10] = ~(a[4] | b[3]);
    assign stage1[9]  = ~(a[3] | b[4]);
    assign stage1[8]  = ~(a[2] | b[5]);
    assign stage1[7]  = ~(a[1] | b[6]);
    assign stage1[6]  =  (a[6] & b[1]);
    assign stage1[5]  =  (a[5] & b[2]);
    assign stage1[4]  =  (a[4] & b[3]);
    assign stage1[3]  =  (a[3] & b[4]);
    assign stage1[2]  =  (a[2] & b[5]);
    assign stage1[1]  =  (a[1] & b[6]);

    
    //now we are checking if a+b is greater then or equal to M or not using sel bit.
    //we are only using the and outputs for the sel bit.

    assign sel = ~(stage1[1] | stage1[2] | stage1[3] | stage1[4] | stage1[5] | stage1[6]);

    
    //now we are using the NOR gate outputs and assigning to another NOR gate output for checking a+b is less then M

    assign sum0[6] = ~(stage1[12] | stage1[11] | stage1[10] | stage1[9] | stage1[8] | stage1[7]);

    
    //from here we are assigning the stage2 variables.

    assign stage2[5] = (stage1[12] | stage1[6]);
    assign stage2[4] = (stage1[11] | stage1[5]);
    assign stage2[3] = (stage1[10] | stage1[4]);
    assign stage2[2] = (stage1[9]  | stage1[3]);
    assign stage2[1] = (stage1[8]  | stage1[2]);
    assign stage2[0] = (stage1[7]  | stage1[1]);

    
    //from here we are using and gate in the third stage.

    assign stage3[5] = (stage2[5] & stage2[4]);
    assign stage3[4] = (stage2[4] & stage2[3]);
    assign stage3[3] = (stage2[3] & stage2[2]);
    assign stage3[2] = (stage2[2] & stage2[1]);
    assign stage3[1] = (stage2[1] & stage2[0]);

    
    //  from here on to locate 1value bit among all the other bits we are 
    //  operating the and outputs with NOR gate.
    //   and storing in their respective sum0 and sum1 arrays.

    assign sum0[5] =  ~(stage3[5] | stage3[4] | stage3[3] | stage3[2] | stage3[1]);
    assign sum1[1] = ~(~(stage3[5] | stage3[4] | stage3[3] | stage3[2] | stage3[1]));

    
    //from here atage 4 will be initiated.

    assign stage4[4] = (stage3[5] & stage3[4]);
    assign stage4[3] = (stage3[4] & stage3[3]);
    assign stage4[2] = (stage3[3] & stage3[2]);
    assign stage4[1] = (stage3[2] & stage3[1]);

    assign sum0[4] = ~(stage4[4] | stage4[3] | stage4[2] | stage4[1]);
    assign sum1[2] = ~(~(stage4[4] | stage4[3] | stage4[2] | stage4[1]));

    
    //from here on stage 5 will be initiated.

    assign stage5[3] = (stage4[4] & stage4[3]);
    assign stage5[2] = (stage4[3] & stage4[2]);
    assign stage5[1] = (stage4[2] & stage4[1]);
    
    assign sum0[3] = ~(stage5[3] | stage5[2] | stage5[1]);
    assign sum1[3] = ~(~(stage5[3] | stage5[2] | stage5[1]));


    //from here on stage 6 will get initiated.
    assign stage6[2] = (stage5[3] & stage5[2]);
    assign stage6[1] = (stage5[2] & stage5[1]);

    assign sum0[2] = ~(stage6[2] | stage6[1]);
    assign sum1[4] = ~(~(stage6[2] | stage6[1]));

    assign sum0[1] = ~(stage6[2] & stage6[1]);
    assign sum1[5] = ~(~(stage6[2] & stage6[1]));

    assign sum1[6] = GND;

    //from here below we are using the sel bit to select the sum if the inputs are greater or lessthen to M using mux
    assign sum[5:1] = sel? sum0[5:1]:sum1[5:1];

    assign sum[6] = (sum0[6] & sel);

endmodule
