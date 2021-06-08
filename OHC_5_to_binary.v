`timescale 1ns / 1ps
module OHC_5_to_binary(in,out);
    input [4:0]in;
    output reg [3:1]out;
    always @(*) begin
        case(in)
            5'b00001:out = 3'o0;
            5'b00010: out = 3'o1;
            5'b00100:out = 3'o2;
            5'b01000:out= 3'o3;
            5'b10000:out = 3'o4;
            default:out= 3'bxxx;
        endcase
    end
endmodule
