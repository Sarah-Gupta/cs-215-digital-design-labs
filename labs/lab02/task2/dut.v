// CS-215 Lab 02 Task 2: T Flip-Flop Template
`timescale 1ns/1ps

module dut (
  input  wire clk,
  input  wire rst, // Synchronous active-high reset
  input  wire t,
  output reg  q,
  output wire q_bar
);

  // Assign q_bar as the negation of q
  assign q_bar = ~q;

  // TODO: Implement T Flip-Flop logic with synchronous reset
  // Hint: T = 1 toggles the state on the rising edge of clk; T = 0 holds the state

endmodule
