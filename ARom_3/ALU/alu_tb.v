`timescale 1ns / 1ps

module alu_tb;

    // 1. Declaración de señales
    reg [3:0] ALUctl;
    reg signed [31:0] A;
    reg signed [31:0] B;
    
    wire signed [31:0] ALUOut;
    wire Zero;

    // 2. Instanciación del módulo ALU
    alu uut (
        .ALUctl(ALUctl),
        .A(A),
        .B(B),
        .ALUOut(ALUOut),
        .Zero(Zero)
    );

    // 3. Estímulos 
    initial begin
        // Inicialización de señales
        ALUctl = 4'b0000;
        A = 32'd0;
        B = 32'd0;
        #100;
        
        // --- 1. AND (ALUctl = 0000) ---
        ALUctl = 4'b0000; A =  32'd255;       B =  32'd170;      #100; // 255 y 170
        ALUctl = 4'b0000; A =  32'd15;        B =  32'd7;        #100; // Intersección
        ALUctl = 4'b0000; A = -32'd1;         B =  32'd255;      #100; // -1 y 255
        ALUctl = 4'b0000; A =  32'd0;         B = -32'd100;      #100; // 0 y -100
        ALUctl = 4'b0000; A = -32'd5;         B = -32'd5;        #100; // Mismos negativos

        // --- 2. OR (ALUctl = 0001) ---
        ALUctl = 4'b0001; A =  32'd240;       B =  32'd15;       #100; // 240 y 15
        ALUctl = 4'b0001; A =  32'd8;         B =  32'd4;        #100; // 8 y 4
        ALUctl = 4'b0001; A = -32'd1;         B =  32'd0;        #100; // OR con -1
        ALUctl = 4'b0001; A =  32'd0;         B =  32'd0;        #100; // Ambos cero
        ALUctl = 4'b0001; A = -32'd10;        B =  32'd10;       #100; // Negativo y positivo

        // --- 3. SUMA (ALUctl = 0010) ---
        ALUctl = 4'b0010; A =  32'd150;       B =  32'd50;       #100; 
        ALUctl = 4'b0010; A = -32'd25;        B =  32'd25;       #100; 
        ALUctl = 4'b0010; A = -32'd30;        B = -32'd70;       #100; 
        ALUctl = 4'b0010; A =  32'd200;       B = -32'd50;       #100; 
        ALUctl = 4'b0010; A = -32'd500;       B =  32'd100;      #100; 

        // --- 4. RESTA
        ALUctl = 4'b0110; A =  32'd80;        B =  32'd30;       #100; 
        ALUctl = 4'b0110; A =  32'd30;        B =  32'd80;       #100; 
        ALUctl = 4'b0110; A = -32'd45;        B = -32'd45;       #100; 
        ALUctl = 4'b0110; A = -32'd10;        B =  32'd20;       #100; 
        ALUctl = 4'b0110; A =  32'd5;         B = -32'd15;       #100; 

        // --- 5. TERNARIA 
        ALUctl = 4'b0111; A =  32'd5;         B =  32'd12;       #100; 
        ALUctl = 4'b0111; A =  32'd20;        B =  32'd4;        #100; 
        ALUctl = 4'b0111; A = -32'd50;        B =  32'd10;       #100; 
        ALUctl = 4'b0111; A =  32'd0;         B = -32'd5;        #100; 
        ALUctl = 4'b0111; A = -32'd100;       B = -32'd20;       #100; 

        // --- 6. IGUALDAD 
        ALUctl = 4'b0011; A =  32'd1234;      B =  32'd1234;     #100; 
        ALUctl = 4'b0011; A =  32'd1234;      B =  32'd4321;     #100; 
        ALUctl = 4'b0011; A = -32'd99;        B = -32'd99;       #100; 
        ALUctl = 4'b0011; A = -32'd99;        B =  32'd99;       #100; 
        ALUctl = 4'b0011; A =  32'd0;         B =  32'd0;        #100; 

        // --- 7. MAYOR QUE
        ALUctl = 4'b0100; A =  32'd50;        B =  32'd25;       #100; 
        ALUctl = 4'b0100; A =  32'd10;        B =  32'd30;       #100; 
        ALUctl = 4'b0100; A =  32'd1;         B = -32'd50;       #100; 
        ALUctl = 4'b0100; A = -32'd5;         B =  32'd0;        #100; 
        ALUctl = 4'b0100; A = -32'd15;        B = -32'd40;       #100; 
        #100 $stop; 
    end

endmodule