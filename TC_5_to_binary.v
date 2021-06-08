`timescale 1ns / 1ps
module TC_5_to_binary(in,out);
    input [4:1]in;
    output reg [3:1] out;
    always @(*) begin
        case (in)
            4'b0000: out = 3'o0;
            4'b0001: out = 3'o1;
            4'b0011: out = 3'o2;
            4'b0111: out = 3'o3;
            4'b1111: out = 3'o4;
            default:out = 3'bxxx;
        endcase
    end
endmodule
