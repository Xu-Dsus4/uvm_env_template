`ifndef XSC_SEQUENCE0_SVH_
`define XSC_SEQUENCE0_SVH_

`ifndef XSC_SEQUENCE0_SVH
`define XSC_SEQUENCE0_SVH
class xsc_sequence0 extends uvm_sequence #(xsc_transaction);

   `uvm_sequence_utils(xsc_sequence0, xsc_sequencer)
   //`uvm_declare_p_sequencer(xsc_sequencer)


   function  new(string name= "xsc_sequence0");
      super.new(name);
   endfunction 

   extern virtual task pre_body();
   extern virtual task body();
   extern virtual task post_body();
   

endclass

task xsc_sequence0::pre_body();
    

endtask

task xsc_sequence0::body();
    uvm_phase phase = get_starting_phase();  // 正确获取当前Phase
    `uvm_info(get_full_name(), "xsc_sequence0 body start", UVM_LOW)
    phase.raise_objection(this);         // 提交Objection
    // 在此处编写测试序列逻辑
    #10000ns;
    phase.drop_objection(this);          // 撤销Objection

    `uvm_info(get_full_name(), "xsc_sequence0 body end", UVM_LOW)
endtask


task xsc_sequence0::post_body();
    

endtask

`endif

`endif // XSC_SEQUENCE0_SVH_