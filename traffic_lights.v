`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:03 10/31/2025 
// Design Name: 
// Module Name:    traffic_lights 
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
module traffic_lights(
    input clk,
    output reg red,
	 output reg green,
	 output reg yellow
    );
// State encoding
reg [1:0] state;
reg [3:0] count;   // counter

parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

initial begin
    state = RED;
    count = 0;
end

always @(posedge clk) begin
    count <= count + 1;

    case(state)
        RED: begin
            if(count == 5) begin
                state <= GREEN;
                count <= 0;
            end
        end

        GREEN: begin
            if(count == 5) begin
                state <= YELLOW;
                count <= 0;
            end
        end

        YELLOW: begin
            if(count == 3) begin
                state <= RED;
                count <= 0;
            end
        end
    endcase
end

// Output logic
always @(*) begin
    red = 0;
    green = 0;
    yellow = 0;

    case(state)
        RED: red = 1;
        GREEN: green = 1;
        YELLOW: yellow = 1;
    endcase
end
endmodule