module PC(
    input clk,
    input [31:0] i_dir,
    output [31:0] o_dir
);
always @(posedge clk)
begin
        o_dir=i_dir;
end


endmodule