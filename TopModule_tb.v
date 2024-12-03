`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:09:09 PM
// Design Name: 
// Module Name: TopModule_tb
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


module TopModule_tb;

    reg clk, reset;          // Clock and reset inputs
    wire [6:0] segments;     // Seven-segment output
    wire [3:0] anodes;       // Anode signals

    // Instantiate the TopModule
    TopModule uut (
        .clk(clk),
        .reset(reset),
        .segments(segments),
        .anodes(anodes)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock -> 10 ns period
    end

    // Stimulus
    initial begin
        $display("Time\tReset\tAnodes\tSegments");
        $monitor("%t\t%b\t%b\t%b", $time, reset, anodes, segments);

        reset = 1;            // Apply reset
        #15 reset = 0;        // Release reset
        #2000 $stop;          // Stop simulation after 2000 ns
    end

endmodule
