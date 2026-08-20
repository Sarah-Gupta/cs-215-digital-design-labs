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

  // Waveform dump configuration
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, uut);
    end
  end

  initial begin
    $display("Starting NOT gate testbench...");

    // TODO: Write your test cases here
    // Hint: Apply stimulus signal (a) and verify output (y) after a delay
    // Example:
    // a = 1'b0; #10;
    // if (y !== 1'b1) $display("Error");
    
    $finish;
  end

endmodule
