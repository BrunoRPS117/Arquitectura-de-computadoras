module MemDatos(

    input EN,//Ennable este se encarga de leer si escribe o leer
    input RE,
	input [31:0] Dir,
    input [31:0] DatoE,
    output reg [31:0] Datos
);

//crear una memoria (arreglo bidimensional)

(* ramstyle = "logic") reg [31:0] MeM [0:31];

//Inicializacion 

initial 

    begin
        $readmemb("C:/Users/USUARIO/Downloads/Bruno_Rene.txt")
       
    
    end

//Lectura
 always @*
    begin
       
       case ({EN, RE}) //CONCATENACION EN es 1 y RE seria 0
       10: MEM[Dir]=DatoE; //Escribir
       01: Datos=MEM[Dir];//LEER
        default: Datos = 32'b0;
       endcase
          
    end

endmodule
