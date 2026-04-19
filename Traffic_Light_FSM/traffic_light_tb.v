`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:11 10/31/2025
// Design Name:   traffic_lights
// Module Name:   /home/ise/TRAFFIC_LIGHTS/traffic_lights_tb.v
// Project Name:  TRAFFIC_LIGHTS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_lights
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_lights_tb;

	// Inputs
	reg clk;

	// Outputs
	wire red,green,yellow;

	// Instantiate the Unit Under Test (UUT)
	traffic_lights uut (
		.clk(clk), 
		.red(red),
      .green(green),
      .yellow(yellow)
	);
	
// Clock generation
always #5 clk = ~clk;

   

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#300;
        
		// Add stimulus here
		$monitor("Time=%0t | R=%b G=%b Y=%b", 
              $time, red, green, yellow);
		$stop;

	end
      
endmodule

