`timescale 1ns / 1ps
module binary_to_5_OHC(in,out);
    input [3:1]in;
    output reg [5:1]out;
    always @(*) begin
        case (in)
            3'o0:out = 5'b00001;
            3'o1:out = 5'b00010;
            3'o2:out = 5'b00100;
            3'o3:out = 5'b01000;
            3'o4:out = 5'b10000;
            default:out=5'bxxxxx;
        endcase
    end
endmodule
