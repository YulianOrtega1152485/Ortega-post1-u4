.model small
.stack 100h

.data
bienvenida db "=== Laboratorio NASM — Unidad 4 ===", 0Dh, 0Ah, "$"
separador  db "----------------------------------------", 0Dh, 0Ah, "$"

.code
main proc
    ; inicializar segmento de datos
    mov ax, @data
    mov ds, ax

    ; imprimir mensaje de bienvenida
    mov ah, 09h
    lea dx, bienvenida
    int 21h

    ; imprimir separador
    lea dx, separador
    int 21h

    ; terminar programa
    mov ax, 4C00h
    int 21h

main endp
end main