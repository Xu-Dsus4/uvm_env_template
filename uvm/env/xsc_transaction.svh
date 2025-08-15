`ifndef XSC_TRANSACTION_SVH_
`define XSC_TRANSACTION_SVH_

`ifndef XSC_TRANSACTION_SVH
`define XSC_TRANSACTION_SVH

class xsc_transaction extends uvm_sequence_item;

    rand bit [31:0]     data;
    rand bit            vld;

    constraint xxx{
        
    }


   `uvm_object_utils_begin(xsc_transaction)
      `uvm_field_int(data, UVM_ALL_ON)
      `uvm_field_int(vld, UVM_ALL_ON)

   `uvm_object_utils_end

   function new(string name = "xsc_transaction");
      super.new();
   endfunction

endclass
`endif
`endif // XSC_TRANSACTION_SVH_