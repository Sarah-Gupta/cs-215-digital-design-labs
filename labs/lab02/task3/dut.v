// CS-215 Lab 02 Task 3: JK Flip-Flop Template
`timescale 1ns/1ps

module dut (
  input  wire clk,
  input  wire rst, // Synchronous active-high reset
  input  wire j,
  input  wire k,
  output reg  q,
  output wire q_bar
);

  // Assign q_bar as the negation of q
  assign q_bar = ~q;

  // TODO: Implement JK Flip-Flop logic with synchronous reset
  // Hint: State transitions on clk rising edge:
  // J=0, K=0 -> Hold
  // J=0, K=1 -> Reset (q=0)
  // J=1, K=0 -> Set (q=1)
  // J=1, K=1 -> Toggle

endmodule
