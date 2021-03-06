`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2018 01:51:49 PM
// Design Name: 
// Module Name: testbench2
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


module testbench2();

logic clk, reset;
logic [1:0] state;
logic [2:0] pathIn;
logic [3:0] floor1;
logic [3:0] floor2;
logic [3:0] floor3;

 nextstatelogic dut( clk , reset , pathIn, state, floor1, floor2, floor3, direction, nextstate, path );

//generate clock
always 
    begin
        clk = 1; #5; clk = 0; #5;
    end
    
    initial 
    begin 
    reset = 1; state = 2'b00; floor1 = 4'b0011; floor2 = 4'b0011; floor3 = 4'b0011; pathIn = 2'b00;
    #100;
    reset = 0; #20;
    end



endmodule
