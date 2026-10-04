<div align="center">

# Semana 04 — Programación Orientada a Objetos
**Laboratorio 04 · Structs, clases, herencia, protocolos y enums**

[Volver al inicio](../README.md)

</div>

---

## Objetivos
- Modelar con `struct`, `class` y `enum`.
- Herencia y **polimorfismo**: la clase base define el flujo y las subclases cambian las reglas con `override`.
- Diferencia entre tipos por valor (struct) y por referencia (class).

## Contenido
| Carpeta | Tipo | Descripción |
|---|---|---|
| [`Manual/Lab04-POO.playground`](Manual/Lab04-POO.playground) | Manual | Caso 1.5 sucursales, FIX, PREDICT, Caso 2A biblioteca y actividades propuestas 01 y 02 |
| [`IA/Lab04-POO`](IA/Lab04-POO) | IA | Caso 2B biblioteca con IA + PROMPTS con la comparación |

## Salida — Caso 1.5: Cadena de sucursales (polimorfismo)
```text
===== Refrigeradora (S/ 2000.0) =====
Lima Centro: Refrigeradora -> S/ 1800.0 + envio S/ 0.0 = S/ 1800.0
Provincia Cusco: Refrigeradora -> S/ 1900.0 + envio S/ 152.0 = S/ 2052.0
Outlet Ate: Refrigeradora -> S/ 1500.0 + envio S/ 0.0 = S/ 1500.0
Tienda Online: Refrigeradora -> S/ 1900.0 + envio S/ 15.0 = S/ 1915.0
===== Licuadora (S/ 250.0) =====
Lima Centro: Licuadora -> S/ 225.0 + envio S/ 30.0 = S/ 255.0
Provincia Cusco: Licuadora -> S/ 237.5 + envio S/ 50.0 = S/ 287.5
Outlet Ate: Licuadora -> S/ 187.5 + envio S/ 0.0 = S/ 187.5
Tienda Online: Licuadora -> S/ 237.5 + envio S/ 15.0 = S/ 252.5
```

## Salida — Caso 2A: Biblioteca
```text
Préstamo aprobado: La ciudad y los perros
Error: La ciudad y los perros ya está prestado
Devolución registrada: La ciudad y los perros
Préstamo aprobado: El Quijote
Error: no existe El Principito
===== INVENTARIO =====
Cien años de soledad (Gabriel García Márquez) - disponible
La ciudad y los perros (Mario Vargas Llosa) - disponible
El Quijote (Miguel de Cervantes) - prestado
```

## Salida — Actividad propuesta 01: Factura de cursos
```text
FACTURA DE CURSOS
Estudiante: Juan León
DNI: 78965412
Alumno de Tecsup: Sí
--------------------------------
Swift Avanzado x1 - S/ 450.00
IA con Python x2 - S/ 1300.00
Diseño UX/UI x1 - S/ 500.00
--------------------------------
Subtotal: S/ 2250.00
IGV (18%): S/ 405.00
Total con IGV: S/ 2655.00
Descuento 10% por cantidad: -S/ 265.50
Descuento especial Tecsup: -S/ 400.00
--------------------------------
TOTAL FINAL A PAGAR: S/ 1989.50
```

### Cómo ejecutarlo
- **Playground:** abrir el `.playground` en Xcode y presionar .
- **Ejercicios con `readLine()`:** en Playground la entrada no funciona; ejecutarlos en Terminal con `swift Contents.swift` dentro de la carpeta del `.playground`.
