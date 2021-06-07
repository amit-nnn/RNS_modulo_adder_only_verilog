`timescale 1ns / 1ps
module ohc_11_modulo_adder(a,b,remainder);
    input[10:0]a,b;
    output[10:0]remainder;

    wire [10:0]annd;
    wire [10:0]oor;
    wire [55:1]stage2;

    assign annd[10] = (a[10] & b[10]);
    assign annd[9] = (a[9] & b[9]);
    assign annd[8] = (a[8] & b[8]);
    assign annd[7] = (a[7] & b[7]);
    assign annd[6] = (a[6] & b[6]);
    assign annd[5] = (a[5] & b[5]);
    assign annd[4] = (a[4] & b[4]);
    assign annd[3] = (a[3] & b[3]);
    assign annd[2] = (a[2] & b[2]);
    assign annd[1] = (a[1] & b[0]);
    assign annd[0] = (a[0] & b[0]);

    assign oor[10] = (a[10] | b[10]);
    assign oor[9] = (a[9] | b[9]);
    assign oor[8] = (a[8] | b[8]);
    assign oor[7] = (a[7] | b[7]);
    assign oor[6] = (a[6] | b[6]);
    assign oor[5] = (a[5] | b[5]);
    assign oor[4] = (a[4] | b[4]);
    assign oor[3] = (a[3] | b[3]);
    assign oor[2] = (a[2] | b[2]);
    assign oor[1] = (a[1] | b[1]);
    assign oor[0] = (a[0] | b[0]);

    assign stage2[55] = (oor[1] & oor[10]);
    assign stage2[54] = (oor[2] & oor[9]);
    assign stage2[53] = (oor[3] & oor[8]);
    assign stage2[52] = (oor[4] & oor[7]);
    assign stage2[51] = (oor[5] & oor[6]);

    assign stage2[50] = (oor[0] & oor[2]);
    assign stage2[49] = (oor[3] & oor[10]);
    assign stage2[48] = (oor[4] & oor[9]);
    assign stage2[47] = (oor[5] & oor[8]);
    assign stage2[46] = (oor[6] & oor[7]);

    assign stage2[45] = (oor[0] & oor[4]);
    assign stage2[44] = (oor[1] & oor[3]);
    assign stage2[43] = (oor[5] & oor[10]);
    assign stage2[42] = (oor[6] & oor[9]);
    assign stage2[41] = (oor[7] & oor[8]);

    assign stage2[40] = (oor[0] & oor[6]);
    assign stage2[39] = (oor[1] & oor[5]);
    assign stage2[38] = (oor[2] & oor[4]);
    assign stage2[37] = (oor[7] & oor[10]);
    assign stage2[36] = (oor[8] & oor[9]);

    assign stage2[35] = (oor[0] & oor[8]);
    assign stage2[34] = (oor[1] & oor[7]);
    assign stage2[33] = (oor[2] & oor[6]);
    assign stage2[32] = (oor[3] & oor[5]);
    assign stage2[31] = (oor[9] & oor[10]);

    assign stage2[30] =  (oor[0] & oor[10]);
    assign stage2[29] =  (oor[1] & oor[9]);
    assign stage2[28] =  (oor[2] & oor[8]);
    assign stage2[27] =  (oor[3] & oor[7]);
    assign stage2[26] =  (oor[4] & oor[6]);

    assign stage2[25] = (oor[0] & oor[1]);
    assign stage2[24] = (oor[2] & oor[10]);    
    assign stage2[23] = (oor[3] & oor[9]);
    assign stage2[22] = (oor[4] & oor[8]);
    assign stage2[21] = (oor[5] & oor[7]);

    assign stage2[20] = (oor[0] & oor[3]);
    assign stage2[19] = (oor[1] & oor[2]);
    assign stage2[18] = (oor[4] & oor[10]);
    assign stage2[17] = (oor[5] & oor[9]);
    assign stage2[16] = (oor[6] & oor[8]);

    assign stage2[15] = (oor[0] & oor[5]);
    assign stage2[14] = (oor[1] & oor[4]);
    assign stage2[13] = (oor[2] & oor[3]);
    assign stage2[12] = (oor[6] & oor[10]);
    assign stage2[11] = (oor[7] & oor[9]);
    
    assign stage2[10] = (oor[0] & oor[7]);
    assign stage2[9] = (oor[1] & oor[6]);
    assign stage2[8] = (oor[2] & oor[5]);
    assign stage2[7] = (oor[3] & oor[4]);
    assign stage2[6] = (oor[8] & oor[10]);
    
    assign stage2[5] = (oor[0] & oor[9]);
    assign stage2[4] = (oor[1] & oor[8]);
    assign stage2[3] = (oor[2] & oor[7]);
    assign stage2[2] = (oor[3] & oor[6]);
    assign stage2[1] = (oor[4] & oor[5]);

    assign remainder[0] = (annd[0] | stage2[55] | stage2[54] | stage2[53] | stage2[52] | stage2[51]);
    assign remainder[2] = (annd[1] | stage2[50] | stage2[49] | stage2[48] | stage2[47] | stage2[46]);
    assign remainder[4] = (annd[2] | stage2[45] | stage2[44] | stage2[43] | stage2[42] | stage2[41]);
    assign remainder[6] = (annd[3] | stage2[40] | stage2[39] | stage2[38] | stage2[37] | stage2[36]);
    assign remainder[8] = (annd[4] | stage2[35] | stage2[34] | stage2[33] | stage2[32] | stage2[31]);
    assign remainder[10] = (annd[5] | stage2[30] | stage2[29] | stage2[28] | stage2[27] | stage2[26]);
    assign remainder[1] = (annd[6] | stage2[25] | stage2[24] | stage2[23] | stage2[22] | stage2[21]);
    assign remainder[3] = (annd[7] | stage2[20] | stage2[19] | stage2[18] | stage2[17] | stage2[16]);
    assign remainder[5] = (annd[8] | stage2[15] | stage2[14] | stage2[13] | stage2[12] | stage2[11]);
    assign remainder[7] = (annd[9] | stage2[10] | stage2[9] | stage2[8] | stage2[7] | stage2[6]);
    assign remainder[9] = (annd[10] | stage2[5] | stage2[4] | stage2[3] | stage2[2] | stage2[1]);
    



endmodule
