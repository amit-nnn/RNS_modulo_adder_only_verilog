`timescale 1ns / 1ps
module TC_to_binary(in,out);
    input [6:1]in;
    output reg [2:0]out;
    always @(*) begin
        case (in)
            6'b000001: out = 3'b001;
            6'b000011: out = 3'b010;
            6'b000111: out = 3'b011;
            6'b001111: out = 3'b100;
            6'b011111: out = 3'b101;
            6'b111111: out = 3'b110;
            default: out = 3'b000;
        endcase
    end


endmodule
