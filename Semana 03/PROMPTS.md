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

## Tarjeta de transporte y modo administrador

### Prompt (estructura CTRFE):
CONTEXTO: Ya tengo la app de consulta de estaciones del Metro de Lima (struct InfoEstacion, diccionario estaciones, funciones buscarEstacion/listarPorLinea/buscarPorDestino).
TAREA: Agrega una tarjeta de transporte que simule saldo, recarga y cobro de pasaje; y un modo administrador que permita agregar una estacion nueva a una linea existente o a una linea completamente nueva, crear una linea nueva vacia, y listar las lineas registradas.
RESTRICCIONES: Mantener el mismo estilo del archivo (struct, diccionarios, funciones simples, comentario en cada linea). El diccionario de estaciones debe pasar de "let" a "var" porque el modo administrador necesita modificarlo. Simular todo con llamadas directas, sin readLine real.
FORMATO: Agregar el codigo al mismo archivo Contents.swift, mas el diseño de un menu con la seccion de administracion.
EJEMPLO: Poder agregar una estacion "Chorrillos" a la Linea 1 existente, y otra estacion a una linea nueva "Linea 4" que no existia antes.

### ¿Funcionó a la primera?
Sí. Se verificó a mano el orden de ejecución del Playground (de arriba hacia abajo) para confirmar que la lista de estaciones de la Línea 1 no incluyera todavía "Chorrillos" en la simulación de RF02, porque esa estación se agrega más adelante en el archivo.

### ¿La IA usó algo que no conocías?
Sí, usar un `Set<String>` (en vez de un array) para el registro de líneas existentes, y `Optional == nil` para revisar si una clave ya existe en el diccionario antes de agregarla. Lo investigué: `Set` evita duplicados automáticamente, y comparar contra `nil` es una forma corta de preguntar "¿ya existe esta clave?".
