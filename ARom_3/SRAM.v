module SRAM(

    input EN, //Ennable este se encarga de leer si escribe o lee
	input [2:0] Dir,
    input clk,
    input [31:0] DatoE,
    output reg [31:0] Datos
);

//crear una memoria (arreglo bidimensional)

reg [31:0] MeM [9:0];

//Inicializacion 

initial 

    begin
        $readmemb("datos.txt", MeM);

    end

//Lectura
 always @(posedge clk) //El poseedge indica que sucede cada flanco de subida
    begin
        if(EN)
            begin
                MeM[Dir]=DatoE;
            end
        else
            begin
                Datos=MeM[Dir];
            end


    end

endmodule
