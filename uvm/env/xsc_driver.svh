`ifndef XSC_DRIVER_SVH_
`define XSC_DRIVER_SVH_

`ifndef XSC_DRIVER_SV
`define XSC_DRIVER_SV

class xsc_driver extends uvm_driver #(xsc_transaction);

   virtual xsc_interface vif;

   `uvm_component_utils(xsc_driver)
   function new(string name = "xsc_driver", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // if(!uvm_config_db#(virtual xsc_interface)::get(this, "", "vif", vif))
      //    `uvm_fatal("xsc_driver", "virtual interface must be set for vif!!!")
   endfunction

   extern task main_phase(uvm_phase phase);
endclass

task xsc_driver::main_phase(uvm_phase phase);

    `uvm_info("xsc_driver", "begin main phase!", UVM_LOW);



endtask




`endif

`endif // XSC_DRIVER_SVH_