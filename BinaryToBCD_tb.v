`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:02:29 PM
// Design Name: 
// Module Name: BinaryToBCD_tb
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


module BinaryToBCD_tb;

    reg clk, reset, start;         // Clock, reset, and start signals
    reg [11:0] binary;             // 12-bit binary input
    wire [15:0] bcd;               // 16-bit BCD output
    wire ready;                    // Ready signal (conversion complete)
    
    // Instantiate the BinaryToBCD module
    BinaryToBCD uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .binary(binary),
        .bcd(bcd),
        .ready(ready)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock -> 10 ns period
    end
    // Stimulus
    initial begin
        // Initialize
        reset = 1; start = 0; binary = 0;
        #10 reset = 0;

        // Test Case 1: Convert 0
        binary = 12'd0;
        start = 1;
        #10 start = 0;
        wait (ready);
        $display("Binary: %d, BCD: %b", binary, bcd);

        // Test Case 2: Convert 5
        binary = 12'd5;
        start = 1;
        #10 start = 0;
        wait (ready);
        $display("Binary: %d, BCD: %b", binary, bcd);

        // Test Case 3: Convert 123
        binary = 12'd123;
        start = 1;
        #10 start = 0;
        wait (ready);
        $display("Binary: %d, BCD: %b", binary, bcd);

        // Test Case 4: Convert 4095 (maximum value)
        binary = 12'd4095;
        start = 1;
        #10 start = 0;
        wait (ready);
        $display("Binary: %d, BCD: %b", binary, bcd);

        // End simulation
        $stop;
    end
endmodule