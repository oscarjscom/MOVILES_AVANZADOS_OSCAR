<div align="center">

# Semana 02 — Condicionales y Bucles
**Laboratorio 02 · Swift en Playground**

[Volver al inicio](../README.md)

</div>

---

## Objetivos
- Estructuras condicionales `if` / `else if` / `else` y `switch` con rangos.
- Bucles `for-in`, `while` y `repeat-while`.
- Ejercicio integrador: carrito de compras con descuentos, categoría de cliente e IGV.

## Contenido
| Carpeta | Tipo | Descripción |
|---|---|---|
| [`Manual/Lab02-Condicionales`](Manual/Lab02-Condicionales) | Manual | Ejercicios 1–5: TODO, FIX y PREDICT resueltos + carrito de compras |
| [`Manual/EjercicioPractico_Biblioteca.playground`](Manual/EjercicioPractico_Biblioteca.playground) | Manual | Ejercicio práctico en clase: préstamo de libro con multa progresiva |
| [`IA/Ejercicio6_CarritoMejorado.playground`](IA/Ejercicio6_CarritoMejorado.playground) | IA | Carrito con cupón, envío, puntos y validaciones |
| [`IA/Ejercicio7_JuegoAdivinanza.playground`](IA/Ejercicio7_JuegoAdivinanza.playground) | IA | Juego de adivinanza con `while` |
| [`IA/PROMPTS.md`](IA/PROMPTS.md) | Documento | Prompts con estructura CTRFE |

## Salida — Ejercicio 5: Carrito de compras
```text
========================================
           TICKET DE COMPRA
  Cliente: VIP
========================================
Laptop x1      S/. 3500.0
Mouse x2       S/. 91.0
Teclado x1     S/. 120.0
Monitor x1     S/. 890.0
USB Cable x3   S/. 45.0
========================================
Subtotal:             S/. 4646.0
Descuento (10.0%): -S/. 464.60
Subtotal c/desc:      S/. 4181.40
IGV (18%):            S/. 752.65
========================================
TOTAL:                S/. 4934.05
========================================
¡Gracias por su compra!
```

### Cómo ejecutarlo
- **Playground:** abrir el `.playground` en Xcode y presionar .
- **Ejercicios con `readLine()`:** en Playground la entrada no funciona; ejecutarlos en Terminal con `swift Contents.swift` dentro de la carpeta del `.playground`.
