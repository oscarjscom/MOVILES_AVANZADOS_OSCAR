# Prompts utilizados — Laboratorio 04

## Herramienta de IA utilizada
Claude (Claude Code)

## Caso 2B — Biblioteca

### Prompt 1:
CONTEXTO: Soy estudiante de Swift, cuarta semana, trabajo en un Playground de Xcode.
TAREA: Necesito una biblioteca con enum EstadoLibro (disponible/prestado), struct Libro (titulo, autor, estado) y class Biblioteca con var libros: [Libro], y los metodos agregar(libro:), prestar(titulo:) -> Bool, devolver(titulo:) -> Bool e inventario().
RESTRICCIONES: Solo struct, class, herencia, protocolos, enums, arrays, bucles y funciones. Sin optionals ni guard let, sin firstIndex(where:), sin didSet, sin propiedades calculadas, sin genericos. prestar y devolver deben recorrer el array por indice (for i in 0..<libros.count) para poder modificar el struct guardado ahi. inventario debe usar switch para mostrar el estado.
FORMATO: Solo el codigo Swift, con las firmas exactas que indico arriba. Comentario en CADA linea explicando que hace (no comentarios genericos como "cambia el estado").
EJEMPLO: [se pegó la salida esperada de la Parte A del enunciado]

### Respuesta de la IA:
Generó el enum, el struct y la clase con los métodos pedidos, usando el bucle por índice tal como se restringió, más la simulación con los 3 libros y las 5 operaciones (prestar, prestar de nuevo, devolver, prestar otro, prestar uno inexistente) y el inventario final.

### ¿Funcionó a la primera?
Sí, porque las restricciones del prompt (sin optionals, sin firstIndex(where:), bucle por índice) ya evitaban de entrada los atajos que suele usar la IA por defecto.

### ¿Usó algo que no hemos visto en clase?
No en este caso — al pedir explícitamente las restricciones del Lab 01/04, la IA se mantuvo dentro de struct/class/enum/arrays/bucles/funciones, sin optionals ni closures.

## Mi versión (Parte A) vs. la versión de la IA (Parte B)

### ¿Qué hizo distinto la IA respecto a mi solución?
[Completa esto después de terminar tu Caso 2A en la rama manual — compara tu código real con Caso2B_Biblioteca.swift]

### ¿Hay alguna línea de la IA que no entiendo del todo? ¿Cuál?
[...]

### ¿Qué me pareció mejor de MI versión?
[...]

### ¿Qué me pareció mejor de la versión de la IA?
[...]
