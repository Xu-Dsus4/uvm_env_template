`ifndef XSC_SEQUENCER_SVH_
`define XSC_SEQUENCER_SVH_

`ifndef XSC_SEQUENCER_SVH
`define XSC_SEQUENCER_SVH

class xsc_sequencer extends uvm_sequencer #(xsc_transaction);
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
      `uvm_update_sequence_lib_and_item(xsc_transaction)
   endfunction 
   
   `uvm_sequencer_utils(xsc_sequencer)
endclass

`endif

`endif // XSC_SEQUENCER_SVH_