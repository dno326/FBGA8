`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:07:13 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule (
    input wire clk,
    input wire reset,
    output wire [6:0] segments,
    output wire [3:0] anodes
);
    wire [11:0] count;
    wire [15:0] bcd;

    // Instantiate the UpCounter
    UpCounter counter (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    // Instantiate the BinaryToBCD converter
    BinaryToBCD converter (
        .binary(count),
        .bcd(bcd)
    );
    // Instantiate the DisplayDriver
    DisplayDriver display (
        .clk(clk),
        .reset(reset),
        .bcd(bcd),
        .segments(segments),
        .anodes(anodes)
    );
endmodule

