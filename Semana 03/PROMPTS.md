# Prompts utilizados — Laboratorio 03

## Herramienta de IA utilizada
Claude (Claude Code)

## Consulta de estaciones - Metro de Lima

### Prompt (estructura CTRFE):
CONTEXTO: Soy estudiante de Swift, tercera semana, curso Programacion en Moviles Avanzado. El profesor pidio una app de consola que consulte estaciones y conexiones del Metro de Lima (Linea 1, Linea 2 y Metropolitano).
TAREA: Necesito un diccionario de estaciones con su(s) linea(s), si tiene ascensor y con que otro sistema conecta (si aplica), mas funciones para buscar una estacion por nombre, listar estaciones de una linea, y buscar por un destino de interes (ej. un estadio).
RESTRICCIONES: Usar datos reales verificados de las lineas del Metro de Lima y el Metropolitano (no inventados). Usar struct, diccionarios, arrays y funciones basicas, sin optionals avanzados mas alla de lo visto en clase. Simular las consultas con llamadas directas porque el Playground no soporta entrada real por consola.
FORMATO: Codigo Swift para Playground, comentando cada linea.
EJEMPLO: El caso de uso "quiero ir al Estadio Nacional" debe devolver la estacion correcta.

### ¿Funcionó a la primera?
Sí, aunque antes de escribir el código se verificaron los datos reales del Metro de Lima y el Metropolitano en Wikipedia (estaciones de la Línea 1 y Línea 2, y las estaciones intermodales oficiales Atocongo y Nicolás Ayllón), para no usar información inventada.

### ¿La IA usó algo que no conocías?
Sí, filtrar un diccionario con `.filter { }` sobre sus pares clave-valor para listar solo las estaciones de una línea. Lo investigué: recorre cada entrada del diccionario y se queda solo con las que cumplen la condición del bloque.

## Nota
El dato de "tiene ascensor" por estación es ilustrativo (no se encontró una fuente oficial estación por estación); las líneas, estados de operación y las conexiones intermodales Atocongo/Nicolás Ayllón sí están verificadas.
