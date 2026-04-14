.model small
.stack 100h

.data
bienvenida db "=== Laboratorio NASM — Unidad 4 ===", 0Dh, 0Ah, "$"
separador  db "----------------------------------------", 0Dh, 0Ah, "$"
etiqueta_a db "Variable A (byte): $"
fin_msg    db 0Dh, 0Ah, "Programa finalizado correctamente.", 0Dh, 0Ah, "$"

var_byte   db 5
tabla      db 1,2,3,4,5

.code
main proc
    ; inicializar DS
    mov ax, @data
    mov ds, ax

    ; imprimir bienvenida
    mov ah, 09h
    lea dx, bienvenida
    int 21h

    lea dx, separador
    int 21h

    ; imprimir etiqueta
    lea dx, etiqueta_a
    int 21h

    ; imprimir var_byte como carácter
    mov al, var_byte
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; salto de línea
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; recorrer tabla
    mov cx, 5
    lea si, tabla

imprimir_tabla:
    mov al, [si]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; espacio
    mov dl, 20h
    int 21h

    inc si
    loop imprimir_tabla

    ; mensaje final
    lea dx, fin_msg
    mov ah, 09h
    int 21h

    ; salir
    mov ax, 4C00h
    int 21h

main endp
end main