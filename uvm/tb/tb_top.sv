`ifndef TB_TOP_SV_
`define TB_TOP_SV_

`timescale 1ns/1ps

`include "uvm_macros.svh"
// `include "xsc_define.svh"
`include "mv_base/mv_base_pkg.sv"
`include "xsc_interface.svh"
`include "wavedump.v"
`include "xsc_env_pkg.svh"


module tb_top;

    import uvm_pkg::*;
    import mv_base_pkg::*;
    import xsc_env_pkg::*;

    `include "xsc_coverage.svh"
    `include "all_tcs.svi"


    logic clk;

    test_dut u_dut();
    xsc_interface xsc_if();

    wavedump u_wavedump();

    initial begin
        clk <= 0;

    end

    always #1 clk = ~clk;

    initial begin
        force u_dut.clk         = clk;
        // force u_dut.reset_n     = xsc_if.reset_n;
    end

    initial begin
        run_test();
    end

    initial begin
        uvm_config_db#(virtual xsc_interface)::set(null,"uvm_test_top.env.in_agt.drv","vif",xsc_if);
        uvm_config_db#(virtual xsc_interface)::set(null,"uvm_test_top.env.in_agt.sqr","vif",xsc_if);
    end

    assign xsc_if.clk       = u_dut.clk; 
    assign u_dut.reset_n    = xsc_if.resetn;
    assign u_dut.data_in    = xsc_if.data;
    assign u_dut.vld        = xsc_if.valid;
    

endmodule


`endif // TB_TOP_SV_