`ifndef TB_TOP_SV_
`define TB_TOP_SV_

`timescale 1ns/1ps

`include "uvm_macros.svh"
// `include "xsc_define.svh"
`include "mv_base_pkg/mv_base_pkg.svh"
`include "xsc_interface.svh"
`include "wavedump.v"
`include "xsc_env_pkg.svh"

module tb_top;

    import uvm_pkg::*;
    import mv_base_pkg::*;
    import xsc_env_pkg::*;

    `include "all_tcs.svi"

    logic clk;
    logic reset_n;

    test_dut u_dut();

    wavedump u_wavedump();

    initial begin
        clk <= 0;
        reset_n <= 0;
        #1000ns;
        reset_n <= 1;
    end

    always #1 clk = ~clk;

    initial begin
        force u_dut.clk         = clk;
        force u_dut.reset_n     = reset_n;
    end

    initial begin
        run_test();
    end

endmodule
`endif // TB_TOP_SV_