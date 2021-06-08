`timescale 1ns / 1ps
module OHC_7_to_binary(in,out);
    input [6:0]in;
    output reg [3:1]out;
    always @(*) begin
        case(in)
            7'b0000001:out=3'o0;
            7'b0000010:out=3'o1;
            7'b0000100:out=3'o2;
            7'b0001000:out=3'o3;
            7'b0010000:out=3'o4;
            7'b0100000:out=3'o5;
            7'b1000000:out=3'o6;
            default:out=3'bxxx;
        endcase
    end
endmodule
