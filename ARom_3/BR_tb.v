`timescale 1ns/1ps

module BR_tb();
    reg EW_tb;
	 reg [4:0]AR1_tb;
    reg [4:0]AR2_tb;
    reg [4:0]AW_tb;
    reg [31:0]DW_tb;
    wire [31:0]DR1_tb;
    wire [31:0]DR2_tb;
    
    BR DUV(
        .EW(EW_tb),
        .AR1(AR1_tb),
        .AR2(AR2_tb),
        .AW(AW_tb),
        .DW(DW_tb),
        .DR1(DR1_tb),
        .DR2(DR2_tb)
    );
	
    //Generacion de señales inicial 
	    initial begin 

        $readmemb("C:/Users/USUARIO/Downloads/Bruno_Rene.txt",DUV.banco);
    
    end
	 
    initial

    begin
    AR1_tb=5'd0;
    AR2_tb=5'd16;
    #100;
    
    AR1_tb=5'd1;
    AR2_tb=5'd17;
    #100;
    
    AR1_tb=5'd2;
    AR2_tb=5'd18;
    #100;
    
    AR1_tb=5'd3;
    AR2_tb=5'd19;
    #100;
    
    AR1_tb=5'd4;
    AR2_tb=5'd20;
    #100;
    
    AR1_tb=5'd5;
    AR2_tb=5'd21;
    #100;
    
    AR1_tb=5'd6;
    AR2_tb=5'd22;
    #100;
    
    AR1_tb=5'd7;
    AR2_tb=5'd23;
    #100;
    
    AR1_tb=5'd8;
    AR2_tb=5'd24;
    #100;
    
    AR1_tb=5'd9;
    AR2_tb=5'd25;
    #100;
    
    AR1_tb=5'd10;
    AR2_tb=5'd26;
    #100;
    
    AR1_tb=5'd11;
    AR2_tb=5'd27;
    #100;
    
    AR1_tb=5'd12;
    AR2_tb=5'd28;
    #100;
    
    AR1_tb=5'd13;
    AR2_tb=5'd29;
    #100;
    
    AR1_tb=5'd14;
    AR2_tb=5'd30;
    #100;
    
    AR1_tb=5'd15;
    AR2_tb=5'd31;
    #100;
    $stop;

    end

endmodule
	