
`ifndef XSC_SEQUENCER_SVH
`define XSC_SEQUENCER_SVH

class xsc_sequencer extends uvm_sequencer #(xsc_transaction);
   
   virtual xsc_interface xsc_vif;
   function new(string name, uvm_component parent);
      super.new(name, parent);
      // `uvm_update_sequence_lib_and_item(xsc_transaction)
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual xsc_interface)::get(this, "", "vif", xsc_vif))
         `uvm_fatal("xsc_sequencer", "virtual interface must be set for vif!!!")
   endfunction
   
   `uvm_sequencer_utils(xsc_sequencer)
endclass




`endif // XSC_SEQUENCER_SVH_