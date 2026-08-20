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
    $display("Starting testbench...");

  // Enter your cases
    $display("All test cases PASSED.");
    $finish;
  end

endmodule
