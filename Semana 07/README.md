# Laboratorio 07 — Manejo de Datos, Tablas y Colecciones (UITableView)

## Enunciado

Curso Programación en Móviles Avanzado — docente Juan León. El laboratorio tiene dos partes:

1. **Tutorial** (crear un proyecto con UITableView): lista de profesores de Tecsup con imagen, usando `UITableViewDataSource`/`UITableViewDelegate`, y luego personalizar la celda con una clase propia (imagen + label) y mostrar una alerta al seleccionar un elemento (`didSelectRowAt`).
2. **Caso a Desarrollar** (lo que se evalúa): una app en UIKit para explorar culturas peruanas.
   - **Pantalla 1 — Lista de Culturas Peruanas:** `UITableView` donde cada celda muestra el nombre y una imagen representativa de la cultura. Al seleccionar una celda, navega a la pantalla de detalle.
   - **Pantalla 2 — Detalle de la Cultura:** nombre, región del Perú, descripción breve e imagen representativa.

## Contenido de esta carpeta

- `Manual/` — tutorial de la lista de profesores + personalización de celda. **Lo construyes tú** (sin IA), en Xcode visual, siguiendo el documento del laboratorio paso a paso.
- `IA/CulturasPeru/` — el **Caso a Desarrollar** (ver `PROMPTS.md` dentro de esa carpeta). App de 3 pantallas armada en `Main.storyboard`, con los segues y constraints visibles:
  1. **Culturas Peruanas:** `UITableView` con celda personalizada (imagen, nombre y region). Segue *Show* `mostrarElementos`.
  2. **Elementos de la cultura:** `UITableView` con imagen y titulo de cada elemento representativo (por ejemplo, Nazca: Lineas de Nazca, Acueductos de Cantalloc, Ceramica policroma). Segue *Show* `mostrarDetalle`.
  3. **Detalle del elemento:** imagen, titulo, cultura y descripcion.

  Los datos pasan de una pantalla a otra con `prepare(for:sender:)`. Son 6 culturas reales (Nazca, Moche, Chavin, Paracas, Wari, Inca) con 3 elementos cada una; las fotos son de Wikimedia Commons con licencia libre.

## Nota sobre el enunciado

Este laboratorio no menciona ramas `manual`/`ai-assisted` ni `PROMPTS.md` como los anteriores, pero seguimos el mismo esquema de honestidad del curso: la parte manual (tutorial) la escribe el alumno sin IA, y la parte con IA queda documentada en `PROMPTS.md`.

El documento también indica que el laboratorio es en grupo de 2 estudiantes; esta entrega se trabajó de forma individual.
