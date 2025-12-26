
`ifndef XSC_IF_SVH
`define XSC_IF_SVH

interface xsc_interface();

    import uvm_pkg::*;

    localparam SETUP_TIME = 0.1;
    localparam HOLD_TIME = 0.1;


    logic           clk;
    logic           resetn;
    logic [31:0]    data;
    logic           valid;
    logic           test;



    // clocking drv_cb @(posedge clk);
    // default input #SETUP_TIME output #HOLD_TIME;

    // endclocking





endinterface


`endif // XSC_INTERFACE_SVH_