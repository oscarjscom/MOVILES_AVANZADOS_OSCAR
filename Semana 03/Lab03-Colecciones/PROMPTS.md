# Prompts — Lab 03 (Colecciones)
## Docente: Juan Leon — Tecsup
## Herramienta: Claude (Claude Code)

## Ejercicio 6 — Gestión de notas

### Prompt (CTRFE):
CONTEXTO: Estudiante iOS semana 3 del curso Programación en Móviles Avanzado. Ya vimos variables, condicionales, switch, bucles, arrays, diccionarios, sets y `readLine()`.
TAREA: Programa de consola que pida N alumnos con nombre y 3 notas y los guarde en un diccionario `[String: [Double]]`. Calcular el promedio de cada alumno y clasificarlo con `switch` (Excelente 18–20, Bueno 15–17, Aprobado 13–14, Desaprobado < 13). Mostrar estadísticas: promedio general, nota más alta, nota más baja y % de aprobados. Mostrar el ranking ordenado por promedio.
RESTRICCIONES: Solo lo de las semanas 1–3. NO struct/class, NO closures (`sorted(by:)`, `filter`, `map`). El ordenamiento debe hacerse con bucles e índices.
FORMATO: Código Swift con un comentario específico en CADA línea. Header `// Desarrollado por: Oscar Olano`.
EJEMPLO: Ana 18, 19, 17 → Promedio 18.00 (Excelente); Luis 12, 14, 10 → 12.00 (Desaprobado); María 15, 16, 14 → 15.00 (Bueno). Aprobados: 2 de 3 (66.7 %).

### ¿Funcionó a la primera?
Sí. La primera idea fue ordenar con `sorted(by:)`, pero como la restricción prohíbe closures, se usó el método burbuja sobre dos arrays paralelos (nombres y promedios), intercambiando ambos a la vez para que cada nombre siga junto a su promedio.

### ¿La IA usó algo que no conocías?
Sí, el método burbuja: compara pares vecinos y los intercambia si están en el orden equivocado; tras cada pasada el menor queda al final. También el truco de empezar `notaMasBaja` en 20 y `notaMasAlta` en 0 para que la primera nota real reemplace esos valores.

## Ejercicio 7 — Inventario con menú

### Prompt (CTRFE):
CONTEXTO: Mismo curso, semana 3. Ya tengo el ejercicio de inventario del TODO 10 (diccionarios de precios y stocks).
TAREA: Pedir N productos con nombre, precio y stock. Luego un menú con `while` que se repita hasta elegir Salir: 1) Ver inventario 2) Buscar 3) Stock bajo 4) Valor total 5) Salir. Reportes formateados con 2 decimales.
RESTRICCIONES: Solo semanas 1–3. Dos diccionarios `[String: Double]` y `[String: Int]` con la misma clave. Sin struct/class ni closures. Evitar el bucle infinito si se acaba la entrada.
FORMATO: Código Swift con comentario en CADA línea.
EJEMPLO: Laptop S/. 3500 stock 4, Mouse S/. 45.50 stock 20, Teclado S/. 120 stock 2 → Stock bajo: Laptop y Teclado; Valor total: S/. 15150.00.

### ¿Funcionó a la primera?
Sí. Se agregó `readLine() ?? "5"` en la opción del menú para que, si la entrada termina (por ejemplo al probar con datos pegados), el programa salga en vez de repetir el menú sin fin.

### ¿La IA usó algo que no conocías?
`if let precio = precios[buscar]`: busca la clave y solo entra al bloque si existe, evitando trabajar con un valor vacío. También `stocks[nombre] ?? 0` para usar 0 cuando la clave no está.

## Mi versión (rama manual) vs. la versión de la IA
- **Distinto:** la IA separó el reporte en secciones (por alumno, ranking y estadísticas) y validó los casos sin datos (`if total > 0`, `if n > 0`) para no dividir entre 0 ni crear el rango inválido `1...0`.
- **Mejor de mi versión:** es más corta y sigue exactamente los TODO del laboratorio.
- **Mejor de la versión de la IA:** el menú con `while` + `switch` hace el inventario reutilizable sin volver a ejecutar el programa.

> La consulta del Metro de Lima (`Lab03-MetroLima`) es un trabajo adicional de esta semana; sus prompts están en `Semana 03/PROMPTS.md`.
