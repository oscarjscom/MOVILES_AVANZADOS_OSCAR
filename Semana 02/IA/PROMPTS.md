# Prompts utilizados — Laboratorio 02

## Herramienta de IA utilizada
Claude (Claude Code)

## Ejercicio 6 — Carrito mejorado

### Prompt (estructura CTRFE):
CONTEXTO: Tengo un carrito de compras en Swift con productos (nombre, precio, cantidad) para el Laboratorio 02 de Programacion en Moviles Avanzado.
TAREA: Mejora el carrito agregando: descuento del 5% extra por producto si se compran 3 o mas unidades de ese producto, un cupon "DESCUENTO20" que da 20% adicional sobre el total, envio gratis si el total supera S/. 3000 (si no, S/. 25.00), puntos de fidelidad (1 punto por cada S/. 100 de compra), y validacion de precios negativos o cantidades en 0.
RESTRICCIONES: Usa Swift basico (structs, for, if), sin arrays complejos ni funciones externas al archivo. Comenta cada linea del codigo explicando que hace, sin comentarios genericos como "calcula algo".
FORMATO: Codigo Swift para Playground, terminando con un ticket impreso por consola.
EJEMPLO: Los 5 productos base son Laptop, Mouse, Teclado, Monitor y USB Cable, igual que en el Ejercicio 5 del carrito simple.

### ¿Funcionó a la primera?
Casi. Tuve que verificar con la IA si el envio gratis se calculaba sobre el total antes o despues del cupon; se ajusto para que sea despues del cupon, que es el orden logico de una compra real.

### ¿La IA usó algo que no conocías?
Si, el operador ternario `condicion ? valorSiVerdadero : valorSiFalso` para decidir el costo de envio en una sola linea. Lo investigue: es una forma corta de escribir un if/else que devuelve un valor.

## Ejercicio 7 — Juego de adivinanza

### Prompt (estructura CTRFE):
CONTEXTO: Necesito un mini juego de adivinanza de numeros en Swift Playground para el Laboratorio 02.
TAREA: Genera un juego con un numero secreto fijo, 5 intentos simulados con variables (no arrays), un bucle while que recorra los intentos mostrando "Muy alto", "Muy bajo" o "Correcto", que cuente cuantos intentos necesito, y que muestre "Perdiste. El numero era: X" si no acierta en los 5 intentos.
RESTRICCIONES: No uses arrays (es tema de la Semana 3, todavia no lo vimos en clase). Comenta cada linea explicando la logica de comparacion.
FORMATO: Codigo Swift para Playground con salida por consola, un print por intento.
EJEMPLO: intento1 = 20, intento2 = 50, etc., como sugiere el enunciado del laboratorio.

### ¿Funcionó a la primera?
Si, aunque revise con la IA que el numero de intentos se imprimiera correctamente cuando el jugador ganaba antes del quinto intento (por ejemplo, ganar en el intento 3 y no seguir contando de mas).

### ¿La IA usó algo que no conocías?
Si, usar una variable booleana (`adivino`) junto con el contador para decidir cuando termina el `while`, en vez de depender solo del numero de intentos. Lo investigue: sirve para poder salir del bucle apenas se cumple la condicion de exito, sin esperar a que el contador llegue al limite.
