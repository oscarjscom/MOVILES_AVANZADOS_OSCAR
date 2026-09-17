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

## Lugares cercanos a una estación

### Prompt (estructura CTRFE):
CONTEXTO: Ya tengo la app de consulta de estaciones, la tarjeta de transporte y el modo administrador.
TAREA: Agrega una funcion que, dado el nombre de una estacion, muestre los lugares o puntos de interes cercanos (si hay datos registrados), y que distinga entre "la estacion no existe" y "la estacion existe pero no tiene lugares registrados".
RESTRICCIONES: Usar datos reales verificados cuando sea posible (ej. Museo de la Nacion junto a la estacion La Cultura, o el propio Estadio Nacional junto a la estacion Estadio Nacional). Marcar como ilustrativo cualquier dato que no se pudo verificar.
FORMATO: Mismo estilo del archivo, con comentario en cada linea, y agregarlo a la simulacion y al menu.

### ¿Funcionó a la primera?
Sí. Antes de escribir los datos se verificó que la estación "La Cultura" (Línea 1) está junto al Museo de la Nación, y que "Gamarra" da nombre al Emporio Comercial Gamarra — el dato de "Real Plaza Atocongo" se dejó marcado como ilustrativo porque no se verificó contra una fuente oficial.

### ¿La IA usó algo que no conocías?
Sí, encadenar `if let lugares = diccionario[clave], !lugares.isEmpty` en una sola condición. Lo investigué: primero intenta desenvolver el optional, y si lo logra, además revisa que el array no esté vacío — solo entra al bloque si se cumplen las dos cosas.

## Version interactiva real (readLine en Terminal)

### Prompt (estructura CTRFE):
CONTEXTO: La version del Playground simula las consultas con llamadas directas porque readLine() no funciona ahi.
TAREA: Crea una version aparte, en un archivo .swift normal (no un Playground), con un menu interactivo de verdad usando readLine(), que llame a las mismas funciones ya escritas.
RESTRICCIONES: No modificar el Playground oficial. El archivo nuevo debe poder correrse con "swift archivo.swift" desde Terminal.
FORMATO: Un solo archivo .swift con todo el codigo necesario (duplicando los datos y funciones del Playground, ya que un script suelto no puede importar otro archivo sin un paquete de Swift).

### ¿Funcionó a la primera?
Sí, aunque hubo que investigar que Xcode Playground no soporta stdin real, y que por eso hacia falta correrlo como script en Terminal para que `readLine()` funcione de verdad.

### ¿La IA usó algo que no conocías?
Sí, `print(mensaje, terminator: "> ")` para imprimir un mensaje sin salto de linea y dejar el cursor listo para escribir la respuesta al lado. Lo investigué: el parametro `terminator` reemplaza el salto de linea por defecto de `print`.

## Completar el diccionario con todas las estaciones reales

### Prompt (estructura CTRFE):
CONTEXTO: El diccionario de estaciones solo tenia 11 estaciones de ejemplo, no todas las reales que ya estaban documentadas en el README.
TAREA: Completa el diccionario con todas las estaciones verificadas (Linea 1 completa, Linea 2 las 5 en operacion, y una seleccion amplia del Metropolitano), y agrega una funcion para listar todas las estaciones disponibles, para no tener que memorizarlas al usar el menu interactivo.
RESTRICCIONES: No inventar estaciones. Si el mismo nombre existe en mas de un sistema en ubicaciones distintas (Angamos, Veintiocho de Julio), diferenciarlas para no tratarlas como si fueran la misma estacion fisica.
FORMATO: Actualizar tanto el Playground como la version interactiva con los mismos datos.

### ¿Funcionó a la primera?
Sí, pero fue clave revisar primero si había nombres de estación repetidos entre sistemas antes de simplemente agregar todo al diccionario — de lo contrario, agregar la "Angamos" del Metropolitano hubiera sobrescrito la "Angamos" de la Línea 1 (son ubicaciones distintas).

### ¿La IA usó algo que no conocías?
Sí, que el `filter` y las demás funciones sobre diccionarios en Swift no distinguen si dos entradas "deberían" ser la misma estación — solo comparan por la clave exacta. Por eso hay que resolver las colisiones de nombre en los datos mismos (con un sufijo), no en la lógica.
