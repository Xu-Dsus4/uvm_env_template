
`ifndef XSC_ENV_SVH
`define XSC_ENV_SVH

class xsc_env extends uvm_env;

   xsc_agent in_agt;
   
   function new(string name = "xsc_env", uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      in_agt = xsc_agent::type_id::create("in_agt",this);
      in_agt.is_active = UVM_ACTIVE;

   endfunction

   extern virtual function void connect_phase(uvm_phase phase);
   
   `uvm_component_utils(xsc_env)
endclass

function void xsc_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);

endfunction


`endif // XSC_ENV_SVH_