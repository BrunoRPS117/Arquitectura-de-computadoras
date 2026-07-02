module MemDatos(

    input EN,//Ennable este se encarga de leer si escribe o leer
    input RE,
	input [31:0] Dir,
    input [31:0] DatoE,
    output reg [31:0] Datos
);

//crear una memoria (arreglo bidimensional)

(* ramstyle = "logic") reg [7:0] MeM [0:255];

//Inicializacion 

initial 

    begin
        $readmemb("C:/Users/USUARIO/Downloads/Bruno_Rene.txt")
       
    
    end

//Lectura
 always @*
    begin
       
       Datos={MEM[Dir],MEM[Dir+1],MEM[Dir+2],MEM[Dir+3]}
          
    end

endmodule
