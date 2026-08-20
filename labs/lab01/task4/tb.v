// CS-215 Lab 01 Task 4: XOR Gate Testbench
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
    $display("Starting XOR gate testbench...");

    // TODO: Write your test cases here
    // Hint: Apply stimulus signals (a, b) and verify output (y) after a delay
    // Example:
    // a = 1'b0; b = 1'b0; #10;
    // if (y !== 1'b0) $display("Error");
    
    $finish;
  end

endmodule
