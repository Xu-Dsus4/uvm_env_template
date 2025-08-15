`ifndef WAVEDUMP_V
`define WAVEDUMP_V


module wavedump;

integer start, stop;
initial begin
    if($test$plusargs("dump")) begin

        $fsdbAutoSwitchDumpfile(50000,"tb_top.fsdb",10);
        $fsdbDumpvarsToFile("dump.lst");

        $fsdbDumpvars(0,tb_top);
        
    end

end

endmodule

`endif 