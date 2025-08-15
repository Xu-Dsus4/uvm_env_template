`ifndef XSC_BASE_TEST_SV_
`define XSC_BASE_TEST_SV_

// class xsc_base_test extends uvm_test;
class xsc_base_test extends mv_test;
    xsc_env env;

    function new(string name = "xsc_base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);

    `uvm_component_utils(xsc_base_test)
endclass

function void xsc_base_test::build_phase(uvm_phase phase);
    `uvm_info(get_name(), $sformatf("build phase start"), UVM_LOW)
    super.build_phase(phase);
    env = xsc_env::type_id::create("env", this);
    `uvm_info(get_name(), $sformatf("build phase end"), UVM_LOW)
endfunction

function void xsc_base_test::report_phase(uvm_phase phase);
    uvm_report_server server;
    int err_num;

    super.report_phase(phase);

    server = get_report_server();
    err_num = server.get_severity_count(UVM_ERROR);

    if (err_num != 0) begin
        $display("TEST CASE FAILED");
    end else begin
        $display("TEST CASE PASSED");
    end
endfunction
`endif // XSC_BASE_TEST_SV_