# Laboratorio 07 — Manejo de Datos, Tablas y Colecciones (UITableView)

## Enunciado

Curso Programación en Móviles Avanzado — docente Juan León. El laboratorio tiene dos partes:

1. **Tutorial** (crear un proyecto con UITableView): lista de profesores de Tecsup con imagen, usando `UITableViewDataSource`/`UITableViewDelegate`, y luego personalizar la celda con una clase propia (imagen + label) y mostrar una alerta al seleccionar un elemento (`didSelectRowAt`).
2. **Caso a Desarrollar** (lo que se evalúa): una app en UIKit para explorar culturas peruanas.
   - **Pantalla 1 — Lista de Culturas Peruanas:** `UITableView` donde cada celda muestra el nombre y una imagen representativa de la cultura. Al seleccionar una celda, navega a la pantalla de detalle.
   - **Pantalla 2 — Detalle de la Cultura:** nombre, región del Perú, descripción breve e imagen representativa.

## Contenido de esta carpeta

- `Manual/` — tutorial de la lista de profesores + personalización de celda. **Lo construyes tú** (sin IA), en Xcode visual, siguiendo el documento del laboratorio paso a paso.
- `IA/CulturasPeru/` — el **Caso a Desarrollar** completo (ver `PROMPTS.md` dentro de esa carpeta): proyecto Xcode con `Cultura.swift` (modelo), `ViewController.swift` (Pantalla 1), `DetalleCulturaViewController.swift` (Pantalla 2), y 6 culturas reales (Nazca, Moche, Chavín, Paracas, Wari, Inca) con imágenes de licencia libre de Wikimedia Commons.

## Nota sobre el enunciado

Este laboratorio no menciona ramas `manual`/`ai-assisted` ni `PROMPTS.md` como los anteriores, pero seguimos el mismo esquema de honestidad del curso: la parte manual (tutorial) la escribe el alumno sin IA, y la parte asistida por IA queda documentada.

El documento también indica que el laboratorio es en grupo de 2 estudiantes; esta entrega se trabajó de forma individual.
