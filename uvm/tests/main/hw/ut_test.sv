`ifndef UT_TEST_SV_
`define UT_TEST_SV_

class ut_test extends xsc_base_test;
`uvm_component_utils(ut_test)

    function new(string name = "ut_test", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(uvm_object_wrapper)::set(this,"env.in_agt.sqr.main_phase","default_sequence",xsc_sequence0::type_id::get());
    endfunction

    task main_phase(uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        phase.drop_objection(this);
    endtask

endclass

`endif // UT_TEST_SV_