`timescale 1ns / 1ps
module binary_to_11_OHC(in,out);
    input [4:1]in;
    output reg[11:1] out;
    always @(*) begin
       case (in)
            4'h0:out = 11'b00000000001;
            4'h1:out = 11'b00000000010;
            4'h2:out = 11'b00000000100;
            4'h3:out = 11'b00000001000;
            4'h4:out = 11'b00000010000;
            4'h5:out = 11'b00000100000;
            4'h6:out = 11'b00001000000;
            4'h7:out = 11'b00010000000;
            4'h8:out = 11'b00100000000;
            4'h9:out = 11'b01000000000;
            4'hA:out = 11'b10000000000;
            default:out=11'bxxxxxxxxxxx;
       endcase 
    end
endmodule
