`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2018 07:50:35 PM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module testbench();

logic clk_in, reset;
logic [1:0] state;
logic [2:0] pathIn;
logic [3:0] floor1;
logic [3:0] floor2;
logic [3:0] floor3;

nextstatelogic dut( clk_in , reset , pathIn, state, floor1, floor2, floor3, direction, nextstate, path );

//generate clock
always 
    begin
        clk_in = 1; #5; clk_in = 0; #5;
        pathIn <= path;
        state <= nextstate;
    end
    
    initial 
    begin 
    reset = 1; state = 2'b00; floor1 = 4'b0011; floor2 = 4'b0011; floor3 = 4'b0011; #20;
    reset = 0; #100;

    end


endmodule