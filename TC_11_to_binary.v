`timescale 1ns / 1ps
module TC_11_to_binary(in,out);
    input [10:1]in;
    output reg [4:1] out;
    always @(*) begin
        case (in)
            10'b0000000000: out = 4'h0;
            10'b0000000001: out = 4'h1;
            10'b0000000011: out = 4'h2;
            10'b0000000111: out = 4'h3;
            10'b0000001111: out = 4'h4;
            10'b0000011111: out = 4'h5;
            10'b0000111111: out = 4'h6;
            10'b0001111111: out = 4'h7;
            10'b0011111111: out = 4'h8;
            10'b0111111111: out = 4'h9;
            10'b1111111111: out = 4'hA;
            default:out = 4'bxxxx;
        endcase
    end

endmodule
