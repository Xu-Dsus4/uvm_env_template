`ifndef XSC_AGENT_SVH_
`define XSC_AGENT_SVH_

class xsc_agent extends uvm_agent;
    xsc_sequencer sqr;
    xsc_driver drv;
    // my_monitor mon;

    // uvm analysis port #(my_transaction) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

    `uvm_component_utils(xsc_agent)
endclass

function void xsc_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (is_active == UVM_ACTIVE) begin
        sqr = xsc_sequencer::type_id::create("sqr", this);
        drv = xsc_driver::type_id::create("drv", this);
    end
    // mon = my_monitor::type_id::create("mon", this);
endfunction

function void xsc_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (is_active == UVM_ACTIVE) begin
        // drv.seq_item_port.connect(sqr.seq_item_export);
    end
    // ap = mon.ap;
endfunction
`endif // XSC_AGENT_SVH_