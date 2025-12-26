`ifndef XSC_SEQUENCE0_SVH_
`define XSC_SEQUENCE0_SVH_

class xsc_sequence0 extends uvm_sequence #(xsc_transaction);

   xsc_transaction   xsc_trans;
   `uvm_object_utils_begin(xsc_sequence0)
   `uvm_object_utils_end
   `uvm_declare_p_sequencer(xsc_sequencer)


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
    p_sequencer.xsc_vif.test = 0;
    for(int i=0;i<10;i++)begin
      p_sequencer.xsc_vif.test = ~p_sequencer.xsc_vif.test;
      #100ns;
      xsc_trans = xsc_transaction::type_id::create("xsc_trans");
      `uvm_do(xsc_trans)
      `uvm_info(get_full_name(), $sformatf("send %0d trans",i), UVM_LOW)

    end
    phase.drop_objection(this);          // 撤销Objection

    `uvm_info(get_full_name(), "xsc_sequence0 body end", UVM_LOW)
endtask


task xsc_sequence0::post_body();
    

endtask


`endif // XSC_SEQUENCE0_SVH_