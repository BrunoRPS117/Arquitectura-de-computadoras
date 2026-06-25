module BR(
    input EW,
    input [4:0] AR1,
    input [4:0] AR2,
    input [4:0] AW,
    input [31:0] DW,
    output reg [31:0] DR1,
    output reg [31:0] DR2
);


    reg [31:0] banco [0:31];

 

    always @* begin
        if(EW) begin
            banco[AW] = DW;
        end
        DR1 = banco[AR1];
        DR2 = banco[AR2];
    end

    
endmodule