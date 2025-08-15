`ifndef XSC_INTERFACE_SVH_
`define XSC_INTERFACE_SVH_

`ifndef XSC_IF_SVH
`define XSC_IF_SVH

interface xsc_interface(input clk, input rst_n);

    import uvm_pkg::*;

    localparam SETUP_TIME = 0.1;
    localparam HOLD_TIME = 0.1;


    logic [31:0] data;
    logic valid;



    clocking drv_cb @(posedge clk);
    default input #SETUP_TIME output #HOLD_TIME;

    endclocking





endinterface

`endif
`endif // XSC_INTERFACE_SVH_