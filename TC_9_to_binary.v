`timescale 1ns / 1ps
module TC_9_to_binary(in,out);
    input [8:1]in;
    output reg[4:1]out;
    always @(*) begin
        case (in)
            8'b00000000: out = 4'h0;
            8'b00000001: out = 4'h1;
            8'b00000011: out = 4'h2;
            8'b00000111: out = 4'h3;
            8'b00001111: out = 4'h4;
            8'b00011111: out = 4'h5;
            8'b00111111: out = 4'h6;
            8'b01111111: out = 4'h7;
            8'b11111111: out = 4'h8;
            default:out=4'bxxxx;
        endcase
    end
endmodule
