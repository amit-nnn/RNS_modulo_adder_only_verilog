`timescale 1ns / 1ps
module Binary_to_11_TC(in,out);
    input [4:1] in;
    output reg [10:1] out;
    always @(*) begin
        case (in)
            4'h0: out =10'b0000000000; 
            4'h1: out =10'b0000000001;
            4'h2: out =10'b0000000011;
            4'h3: out =10'b0000000111;
            4'h4: out =10'b0000001111;
            4'h5: out =10'b0000011111;
            4'h6: out =10'b0000111111;
            4'h7: out =10'b0001111111;
            4'h8: out =10'b0011111111;
            4'h9: out =10'b0111111111;
            4'hA: out =10'b1111111111;
            default:out=10'bxxxxxxxxxx;
        endcase
    end

endmodule
