`ifndef TEST_DUT_SV_
`define TEST_DUT_SV_

module test_dut(
    input           clk,
    input           reset_n,
    input [31:0]    data_in,
    input           vld,

    output [31:0]   data_out,
    output          data_vld
);


logic [31:0]    data_in_ff1;
logic           vld_ff1;
logic [31:0]    data_in_ff2;
logic           vld_ff2;
logic [31:0]    data_in_ff3;
logic           vld_ff3;

always_ff @(posedge clk or negedge reset_n)begin
    if(~reset_n)begin
        data_in_ff1 <= 32'h0;
        data_in_ff2 <= 32'h0;
        data_in_ff3 <= 32'h0;
        vld_ff1     <= 1'h0;
        vld_ff2     <= 1'h0;
        vld_ff3     <= 1'h0;
    end
    else begin
        data_in_ff1 <= data_in;
        data_in_ff2 <= data_in_ff2;
        data_in_ff3 <= data_in_ff3;
        vld_ff1     <= vld;
        vld_ff2     <= vld_ff1;
        vld_ff3     <= vld_ff2;
    end

end

assign data_out = data_in_ff3;
assign data_vld = vld_ff3;

endmodule
`endif // TEST_DUT_SV_