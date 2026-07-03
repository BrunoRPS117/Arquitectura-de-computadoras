import re
import os
import tkinter as tk
from tkinter import filedialog

# =====================================================================
# RUTAS DE LOS ARCHIVOS DE ENTRADA
# =====================================================================
ruta_asm = r"C:\Users\USUARIO\Downloads\Arquis de verano\ARom_3\mips_rtype_program.asm"
ruta_txt = r"C:\Users\USUARIO\Downloads\Arquis de verano\ARom_3\regfile_init_dec.txt"

# =====================================================================
# DICCIONARIO Y CONSTANTES (MIPS32 Tipo R)
# =====================================================================
FUNCT_CODES = {
    'ADD': '100000',
    'SUB': '100010',
    'AND': '100100',
    'OR':  '100101',
    'SLT': '101010'
}

OPCODE_R = '000000'  
SHAMT_R = '00000'    

# =====================================================================
# FUNCIÓN PRINCIPAL DE CONVERSIÓN Y GUARDADO
# =====================================================================
def ensamblar_a_binario(asm_texto, direcciones_texto, ruta_salida):
    lista_direcciones = [linea.strip() for linea in direcciones_texto.strip().split('\n') if linea.strip()]
    lineas_asm = asm_texto.strip().split('\n')
    indice_direccion = 0
    
    # Abrimos el archivo de salida elegido por el usuario en modo escritura ('w')
    with open(ruta_salida, 'w', encoding='utf-8') as f_out:
        encabezado = f"{'Dirección (txt)':<16} | {'Instrucción ASM':<22} | {'Código Binario MIPS32 (op | rs | rt | rd | shamt | funct)'}"
        separador = "-" * 115
        
        print(encabezado)
        print(separador)
        f_out.write(encabezado + "\n")
        f_out.write(separador + "\n")
        
        for linea in lineas_asm:
            linea_limpia = linea.split('#')[0].strip()
            if not linea_limpia:
                continue
                
            tokens = [t for t in re.split(r'[\s,]+', linea_limpia) if t]
            if len(tokens) < 4:
                continue
                
            operacion = tokens[0].upper()
            
            try:
                rd_num = int(tokens[1].replace('$', ''))
                rs_num = int(tokens[2].replace('$', ''))
                rt_num = int(tokens[3].replace('$', ''))
                
                rd_bin = format(rd_num, '05b')
                rs_bin = format(rs_num, '05b')
                rt_bin = format(rt_num, '05b')
                
                if operacion in FUNCT_CODES:
                    funct_bin = FUNCT_CODES[operacion]
                    
                    binario_completo = f"{OPCODE_R}{rs_bin}{rt_bin}{rd_bin}{SHAMT_R}{funct_bin}"
                    binario_legible = f"{OPCODE_R} | {rs_bin} | {rt_bin} | {rd_bin} | {SHAMT_R} | {funct_bin}"
                    
                    dir_actual = lista_direcciones[indice_direccion] if indice_direccion < len(lista_direcciones) else "N/A"
                    
                    linea_resultado = f"{dir_actual:<16} | {linea_limpia:<22} | {binario_legible} -> ({binario_completo})"
                    
                    print(linea_resultado)
                    f_out.write(linea_resultado + "\n")
                    
                    indice_direccion += 1
                    
            except ValueError:
                continue
                
    print(f"\n¡Éxito! Los resultados se han guardado en:\n{ruta_salida}")

# =====================================================================
# LECTURA DE ARCHIVOS Y EJECUCIÓN
# =====================================================================
def main():
    # 1. Validar que los archivos de entrada existan
    if not os.path.exists(ruta_asm):
        print(f"Error: No se encontró el archivo ASM en:\n{ruta_asm}")
        return
        
    if not os.path.exists(ruta_txt):
        print(f"Error: No se encontró el archivo de direcciones en:\n{ruta_txt}")
        return

    # 2. Configurar la ventana para elegir dónde guardar
    root = tk.Tk()
    root.withdraw() # Oculta la ventana principal gris que abre tkinter por defecto
    
    # Abre la ventana de "Guardar como..."
    ruta_salida = filedialog.asksaveasfilename(
        title="Guardar resultados binarios como...",
        defaultextension=".txt",
        filetypes=[("Archivos de texto", "*.txt"), ("Todos los archivos", "*.*")]
    )
    
    # Si el usuario cierra la ventana sin guardar o le da a "Cancelar"
    if not ruta_salida:
        print("Operación cancelada. No se seleccionó ninguna ruta para guardar.")
        return

    # 3. Leer archivos y procesar
    try:
        with open(ruta_asm, 'r', encoding='utf-8') as f_asm:
            contenido_asm = f_asm.read()
            
        with open(ruta_txt, 'r', encoding='utf-8') as f_txt:
            contenido_txt = f_txt.read()
            
        ensamblar_a_binario(contenido_asm, contenido_txt, ruta_salida)
        
    except Exception as e:
        print(f"Ocurrió un error: {e}")

if __name__ == "__main__":
    main()