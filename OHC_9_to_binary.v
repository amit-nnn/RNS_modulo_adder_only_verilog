`timescale 1ns / 1ps
module OHC_9_to_binary(in,out);
    input [8:0]in;
    output reg [4:1] out;
    always @(*) begin
        case(in)
            9'b000000001:out=4'h0;
            9'b000000010:out=4'h1;
            9'b000000100:out=4'h2;
            9'b000001000:out=4'h3;
            9'b000010000:out=4'h4;
            9'b000100000:out=4'h5;
            9'b001000000:out=4'h6;
            9'b010000000:out=4'h7;
            9'b100000000:out=4'h8;
            default:out=4'bxxxx;
        endcase
    end
endmodule
