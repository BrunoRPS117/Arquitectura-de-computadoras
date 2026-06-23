module SRom(

    input [2:0] Dir,
    input clk,
    output reg [31:0] Datos
);

//crear una memoria (arreglo bidimensional)

reg [31:0] MeM [4:0];

//Inicializacion 

initial 

    begin

        MeM [0] = 32'd 255;
        MeM [1] = 32'd 127;
        MeM [2] = 32'd 63;
        MeM [3] = 32'd 31;
        MeM [4] = 32'd 15;
    
    end

//Lectura
 always @(posedge clk) //El poseedge indica que sucede cada flanco de subida
    begin

        Datos = MeM [Dir];
  

    end

endmodule
