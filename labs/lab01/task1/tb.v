// CS-215 Lab 01 Task 1: AND Gate Testbench
`timescale 1ns/1ps

module tb;
  reg a;
  reg b;
  wire y;

  // Instantiate Design Under Test
  dut uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Waveform dump configuration
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, uut);
    end
  end

  initial begin
    $display("Starting AND gate testbench...");

    // TODO: Write your test cases here
    // Hint: Apply stimulus signals (a, b) and verify output (y) after a delay
    // Example:
    // a = 1'b0; b = 1'b0; #10;
    // if (y !== 1'b0) $display("Error");
    
    a = 1'b0;
    b = 1'b0;
    #10;
    if(y != 1'b0)
      $display("Error: 0 and 0 should be 0");
    else
       $display("Test 1 passed");

    a = 1'b0;
    b = 1'b1;
    #10;
    if (y !== 1'b0)
      $display("Error: 0 AND 1 should be 0");
    else
      $display("Test 2 passed");  

     a = 1'b1;
    b = 1'b0;
    #10;
    if (y !== 1'b0)
      $display("Error: 1 AND 0 should be 0");
    else
      $display("Test 3 passed");

      a = 1'b1;
    b = 1'b1;
    #10;
    if (y !== 1'b1)
      $display("Error: 1 AND 1 should be 1");
    else
      $display("Test 4 passed");

    $finish;
  end

endmodule
