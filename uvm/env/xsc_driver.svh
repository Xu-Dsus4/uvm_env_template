
`ifndef XSC_DRIVER_SV
`define XSC_DRIVER_SV

class xsc_driver extends uvm_driver #(xsc_transaction);

   xsc_transaction         xsc_trans;
   virtual xsc_interface   xsc_vif;

   `uvm_component_utils(xsc_driver)
   function new(string name = "xsc_driver", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual xsc_interface)::get(this, "", "vif", xsc_vif))
         `uvm_fatal("xsc_driver", "virtual interface must be set for vif!!!")
   endfunction

   extern task main_phase(uvm_phase phase);
   extern task reset_phase(uvm_phase phase);
endclass

task xsc_driver::reset_phase(uvm_phase phase);

   super.reset_phase(phase);
   phase.raise_objection(this); 
   `uvm_info("xsc_driver", "begin reset phase!", UVM_LOW);
   xsc_vif.resetn <= 0;
   #100ns;
   xsc_vif.resetn <= 1;

   phase.drop_objection(this);  
   `uvm_info("xsc_driver", "end reset phase!", UVM_LOW);
endtask


task xsc_driver::main_phase(uvm_phase phase);

    `uvm_info("xsc_driver", "begin main phase!", UVM_LOW);
    #100ns;
    while(1)begin
      seq_item_port.get_next_item(xsc_trans);
      `uvm_info("xsc_driver", "get one trans", UVM_LOW);
      xsc_trans.print();
      @(posedge xsc_vif.clk);
      xsc_vif.data   <= xsc_trans.data;
      xsc_vif.valid  <= xsc_trans.vld;
      seq_item_port.item_done();
    end



endtask





`endif // XSC_DRIVER_SVH_