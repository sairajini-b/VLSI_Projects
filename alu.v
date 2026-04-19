`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:21 10/31/2025 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] sel,
    output reg [7:0] Y,
	 output reg zero,
    output reg carry_borrow,
	 output reg negative
);

reg [8:0] temp;

always @(*) begin
    temp=0;
	 carry_borrow=0;
	 negative = Y[7]; // MSB
    case(sel)
        3'b000: begin
            temp = A + B;
            Y = temp[7:0];
            carry_borrow = temp[8];
        end

        3'b001: begin
            temp = A - B;
            Y = temp[7:0];
            carry_borrow = temp[8];
        end
		  3'b010: Y = A & B;
        3'b011: Y = A | B;
        3'b100: Y = A ^ B;
        3'b101: Y = ~A;

        default: Y = 8'b00000000;
    endcase

    zero = (Y == 0);
end
 
endmodule