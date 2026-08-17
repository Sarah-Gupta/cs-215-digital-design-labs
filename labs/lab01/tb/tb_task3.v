// CS-215 Lab 01 Task 3: NOT Gate Testbench
`timescale 1ns/1ps

module tb;
  reg a;
  wire y;

  // Instantiate Design Under Test
  dut uut (
    .a(a),
    .y(y)
  );

  initial begin
    $display("Starting NOT gate testbench...");

    // Test case 1
    a = 1'b0; #10;
    if (y !== 1'b1) begin
      $display("❌ ERROR: Input a=0 expected output y=1, but got y=%b", y);
      $finish;
    end

    // Test case 2
    a = 1'b1; #10;
    if (y !== 1'b0) begin
      $display("❌ ERROR: Input a=1 expected output y=0, but got y=%b", y);
      $finish;
    end

    $display("All test cases PASSED.");
    $finish;
  end

endmodule
