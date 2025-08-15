`ifndef XSC_ENV_PKG_SVH_
`define XSC_ENV_PKG_SVH_

package xsc_env_pkg;
    import uvm_pkg::*;

    `include "xsc_transaction.svh"
    // `include "xsc_define.svh"
    `include "xsc_driver.svh"
    // `include "xsc_monitor.svh"
    `include "xsc_sequencer.svh"
    `include "xsc_agent.svh"
    // `include "xsc_scoreboard.svh"
    // `include "xsc_base_vseq.svh"
    // `include "xsc_sequence0.svh"
    `include "ut/xsc_test/env/seq_lib/xsc_seq_lib.svh"
    `include "xsc_env.svh"
endpackage
`endif // XSC_ENV_PKG_SVH_