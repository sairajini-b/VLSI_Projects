`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:48 10/31/2025
// Design Name:   alu
// Module Name:   /home/ise/ALU_PROJECT/alu_test.v
// Project Name:  ALU_PROJECT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [2:0] sel;

	// Outputs
	wire [7:0] Y;
	wire zero, carry_borrow;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.Y(Y),
		.zero(zero),
      .carry_borrow(carry_borrow)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish

        
		// Add stimulus here
		A = 8'd10; B = 8'd5;
      sel = 3'b000; #10; // ADD

      // Case 2 (zero flag test)
      A = 8'd5; B = 8'd5;
      sel = 3'b001; #10; // SUB → result = 0

      // Case 3 (carry test)
      A = 8'd255; B = 8'd1;
      sel = 3'b000; #10; // ADD → overflow
 
      

      $stop;

	end
      
endmodule



