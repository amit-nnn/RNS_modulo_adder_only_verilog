`timescale 1ns / 1ps
module binary_to_7_OHC(in,out);
    input [3:1]in;
    output reg [6:0]out;
    always @(*) begin
        case (in)
            3'o0:out = 7'b0000001;
            3'o1:out = 7'b0000010;
            3'o2:out = 7'b0000100;
            3'o3:out = 7'b0001000;
            3'o4:out = 7'b0010000;
            3'o5:out = 7'b0100000;
            3'o6:out = 7'b1000000;
            default:out=7'bxxxxxxx;
        endcase
    end
endmodule
