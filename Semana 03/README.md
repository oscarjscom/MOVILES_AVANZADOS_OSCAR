# Laboratorio 03 — Consulta de Estaciones, Metro de Lima

## Enunciado

Sistema de consulta en consola sobre el Metro de Lima (Línea 1 y Línea 2) y el Metropolitano. El usuario ingresa el nombre de una estación o un destino de interés, y el sistema devuelve la línea a la que pertenece, si tiene conexión con otra línea/con el Metropolitano, si cuenta con ascensores, y sugerencias de estación si busca un lugar (ej. un estadio).

## Requerimientos funcionales

| # | Requerimiento |
|---|---|
| RF01 | Buscar una estación por nombre y mostrar en qué línea(s) está. |
| RF02 | Listar todas las estaciones de una línea dada (ej. "estaciones de la Línea 2"). |
| RF03 | Indicar si una estación es intermodal (conecta con otra línea o con el Metropolitano) y con cuál. |
| RF04 | Indicar si una estación cuenta con ascensores (accesibilidad). |
| RF05 | Buscar por destino de interés (ej. "Estadio Nacional") y sugerir la estación/sistema más cercano. |
| RF06 | Manejar el caso de una estación que no existe, con mensaje de error claro. |
| RF07 | Mostrar un menú de opciones: buscar estación, listar por línea, buscar por destino, salir. |
| RF08 (bonus) | Sugerir una ruta entre dos estaciones (con trasbordo si aplica). |

## Estructura de datos

```swift
struct InfoEstacion {
    let lineas: [String]        // puede estar en mas de una linea
    let tieneAscensor: Bool
    let conexion: String?       // ej. "Metropolitano", "Linea 2", nil si no tiene
}
```

## Datos reales verificados (Wikipedia, 2026)

**Línea 1** (27 estaciones, operativa): Villa El Salvador, Parque Industrial, Pumacahua, Villa María, María Auxiliadora, San Juan, Atocongo, Jorge Chávez, Ayacucho, Cabitos, Angamos, San Borja Sur, La Cultura, Arriola, Gamarra, Veintiocho de Julio, Miguel Grau, El Ángel, Presbítero Maestro, Rio Rímac, Caja de Agua, Pirámide del Sol, Los Jardines, Los Postes, San Carlos, San Martín, Santa Rosa, Bayóvar.

**Línea 2** (5 en operación desde 2023 / 27 planeadas): tramo activo Evitamiento → Mercado Santa Anita (Evitamiento, Óvalo Santa Anita, Colectora Industrial, Hermilio Valdizán, Mercado Santa Anita). El resto sigue en construcción.

**Conexiones intermodales reales confirmadas (Metropolitano ↔ Línea 1):**
- Nicolás Ayllón (Intermodal M–L1)
- Atocongo (Intermodal M–L1)

**Nota:** existen tres estaciones distintas llamadas "Veintiocho de Julio" (Línea 1, Línea 2 y Metropolitano), en ubicaciones diferentes — el nombre repetido no implica que sea la misma estación física.

El dato de "tiene ascensor" por estación es ilustrativo, no verificado estación por estación contra una fuente oficial.

## Contenido de esta carpeta

- `Lab03-MetroLima.playground` — implementación (rama `ai-assisted`, ver `PROMPTS.md`).
