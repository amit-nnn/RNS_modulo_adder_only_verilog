`timescale 1ns / 1ps
module Binary_to_5_TC(in,out);
    input [3:1] in;
    output reg[4:1] out;
    always @(*) begin
        case (in)
            3'o0: out = 4'b0000;
            3'o1: out = 4'b0001;
            3'o2: out = 4'b0011;
            3'o3: out = 4'b0111;
            3'o4: out = 4'b1111;
            default:out = 4'bxxxx;
        endcase
    end     
endmodule
