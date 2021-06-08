`timescale 1ns / 1ps
module OHC_11_to_binary(in,out);
    input [10:0] in;
    output reg [4:1] out;
    always @(*) begin
        case(in)
            11'b00000000001:out=4'h0;
            11'b00000000010:out=4'h1;
            11'b00000000100:out=4'h2;
            11'b00000001000:out=4'h3;
            11'b00000010000:out=4'h4;
            11'b00000100000:out=4'h5;
            11'b00001000000:out=4'h6;
            11'b00010000000:out=4'h7;
            11'b00100000000:out=4'h8;
            11'b01000000000:out=4'h9;
            11'b10000000000:out=4'hA;
            default:out=4'bxxxx;
        endcase
    end
endmodule
