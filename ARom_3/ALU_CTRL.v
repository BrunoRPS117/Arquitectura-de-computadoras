module ALU_CTRL(
    input [1:0] ALUOP,
    input [4:0] FNC,
    output [3:0] ALC
);

always @*
    begin
        case (ALUOP)
        00: ALC = 4'b0010;//SUMA
        00: ALC = 4'b0010;//SUMA
        01: ALC = 4'b0110;;//RESTA
        10: case ([5:0]FNC)
            100000: ALC = 4'b0010;//SUMA
            100010: ALC = 4'b0110;//RESTA
            100100: ALC = 4'b0000;//AND
            100101: ALC = 4'b0001;//OR
            101010: ALC = 4'b0111;//Set on Less Than 
            default: ALC = x;
        endcase
        default: ALC = x;
        endcase

    end

    endmodule