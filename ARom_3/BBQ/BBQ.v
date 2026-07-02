module BBQ(

    input [18:0] instruccion

);


wire [31:0] C1,C2,C3;
wire zf;

BR costilla (
    .EW (0),
    .AR1(instruccion[18:14]),
    .AR2(instruccion[13:9]),
    .AW(0),
    .DW(0),
    .DR1(C1),
    .DR2(C2)
);

alu brisket(
    .ALUctl(instruccion[3:0]),
    .A(C1), 
    .B(C2),
    .ALUOut(C3),
    .Zero(zf)
);

RAM_noclk macncheese(
    .EN(0),
	.Dir(C3),
    .DatoE(instruccion[8:4]),
    .Datos()
    );


endmodule