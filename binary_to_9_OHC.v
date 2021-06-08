`timescale 1ns / 1ps
module binary_to_9_OHC(in,out);
    input[4:1]in;
    output reg [9:1]out;
    always @(*) begin
        case(in)
            4'h0:out=9'b000000001;
            4'h1:out=9'b000000010;
            4'h2:out=9'b000000100;
            4'h3:out=9'b000001000;
            4'h4:out=9'b000010000;
            4'h5:out=9'b000100000;
            4'h6:out=9'b001000000;
            4'h7:out=9'b010000000;
            4'h8:out=9'b100000000;
            default:out=9'bxxxxxxxxx;
        endcase
    end
endmodule
