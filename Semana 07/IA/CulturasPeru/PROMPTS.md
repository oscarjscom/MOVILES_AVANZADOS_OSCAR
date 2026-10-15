# Prompts utilizados — Laboratorio 07 (Culturas Peruanas)

## Herramienta de IA utilizada
Claude (Claude Code)

## Caso a desarrollar — App de Culturas Peruanas

### Prompt (estructura CTRFE):
CONTEXTO: Laboratorio 07, "Manejo de Datos, Tablas y Colecciones". El tutorial ya ensena a armar un UITableView con una lista de profesores (DataSource/Delegate, celda prototipo, imagen) y a personalizar una celda con una clase propia.
TAREA: Resuelve el "Caso a Desarrollar": una app en UIKit con Pantalla 1 (UITableView con la lista de culturas peruanas, cada celda con nombre e imagen) y Pantalla 2 (detalle de la cultura seleccionada: nombre, region, descripcion e imagen), navegando de una a otra al seleccionar una celda.
RESTRICCIONES: Usar datos reales de culturas peruanas (no inventados), con imagenes de licencia libre y verificada (Wikimedia Commons, Public Domain/CC0/CC BY-SA), citando autor y licencia. UIKit con UITableViewDataSource/UITableViewDelegate, igual que en el tutorial.
FORMATO: Proyecto Xcode completo (como los de semanas anteriores: AppDelegate, SceneDelegate, Info.plist, Assets.xcassets), con comentario en los metodos clave.
EJEMPLO: El tutorial de profesores de Tecsup (lista + imagen) y el de personalizacion con alerta, ambos dentro del mismo documento del laboratorio.

### ¿Funcionó a la primera?
No del todo. La primera idea fue armar las pantallas directamente en Main.storyboard (como pide el tutorial), pero escribir a mano el XML de un Storyboard completo (escenas, constraints, segues) es muy fragil para hacerlo sin la ventana grafica de Xcode delante: un error pequeno puede dejar el proyecto sin poder abrirse. Se cambio el enfoque a armar el UITableView y la pantalla de detalle por codigo (NSLayoutConstraint, UIStackView), que es una forma igual de valida en UIKit y bastante mas segura de verificar sin poder compilar en este equipo.

### ¿La IA usó algo que no conocías?
Sí, dos cosas:
1. `tableView.dequeueReusableCell(withIdentifier:)` (sin `for:`) devuelve un opcional en vez de forzar un registro previo con `register(_:forCellReuseIdentifier:)`; eso permite crear la celda con `UITableViewCell(style: .subtitle, reuseIdentifier:)` la primera vez, algo que no se usaba en los tutoriales anteriores del curso.
2. Armar toda una pantalla (imagen + textos) dentro de un `UIScrollView` con `NSLayoutConstraint.activate([...])` en vez de Interface Builder. Lo investigue: sirve para que el contenido se pueda desplazar si la descripcion de una cultura es muy larga para la pantalla.

## Ajuste pedido por el docente — 3 pantallas en Storyboard

### Prompt 2 (estructura CTRFE):
CONTEXTO: La primera version armaba las pantallas por codigo. El docente pidio que los segues y constraints se vean en el Storyboard y que la app tenga 3 niveles: Culturas -> Elementos de la cultura -> Detalle del elemento, con un commit por cada pantalla nueva.
TAREA: Pasar la app a Main.storyboard con un Navigation Controller, tres escenas, celdas prototipo personalizadas y segues Show con identificador (`mostrarElementos`, `mostrarDetalle`); agregar al modelo los elementos de cada cultura.
RESTRICCIONES: Nada de UI ni navegacion por codigo (sin `pushViewController` ni `NSLayoutConstraint.activate`); outlets con `@IBOutlet` y paso de datos con `prepare(for:sender:)`. Datos reales.
FORMATO: Proyecto Xcode con dos commits: (1) pantalla de elementos por cultura, (2) detalle del elemento.
EJEMPLO: El diagrama de la pizarra: Culturas Peruanas (Nazca, Paracas, Chavin) -> Nazca (imagen + titulo por fila) -> Titulo (imagen + texto).

### ¿Funcionó a la primera?
Se reemplazo `DetalleCulturaViewController` (hecho por codigo) por dos pantallas del Storyboard y se quito la creacion de la ventana en `SceneDelegate`, porque ahora la app arranca desde `Main.storyboard` (`UISceneStoryboardFile = Main`).

### ¿La IA usó algo que no conocías?
Que un segue puede salir directamente de una **celda prototipo**: al tocar la fila se ejecuta solo, y en `prepare(for:sender:)` el `sender` es la celda, de donde se obtiene la fila con `tableView.indexPath(for:)`. Cada elemento tiene su propia foto real de Wikimedia Commons, con la licencia verificada archivo por archivo (ver tabla de fuentes).

## Fuentes e imágenes utilizadas (Wikimedia Commons)

Todas las imágenes son de licencia libre. Se descargaron con permiso explícito del usuario, verificando la licencia real de cada archivo con la API de Wikimedia Commons antes de bajarlas (no se usó texto web genérico, que mezcla licencias).

| Cultura | Archivo | Autor | Licencia |
|---|---|---|---|
| Nazca | Líneas de Nazca, Nazca, Perú, 2015-07-29, DD 55.JPG | Diego Delso | CC BY-SA 4.0 |
| Moche | Moche - Portrait Vessel - Walters 482827.jpg | Anónimo (cultura Moche) / The Walters Art Museum | Public domain |
| Chavín | Chavin de Huantar El Castillo 06122009.jpg | Dtarazona | CC BY-SA 3.0 |
| Machu Picchu | 80 - Machu Picchu - Juin 2009 - edit.jpg | Martin St-Amant (S23678) | CC BY-SA 3.0 |
| Paracas | Man's mantle for mummy, Peru... Textile Museum, George Washington University - DSC09679.JPG | Daderot | Public domain |
| Wari | Fardo Wari.jpg | — | Public domain |


### Fotos de los elementos (Pantallas 2 y 3)

| Elemento | Archivo | Autor | Licencia |
|---|---|---|---|
| Nazca — Acueductos de Cantalloc | Acueductos subterráneos de Cantalloc, Nazca, Perú, 2015-07-29, DD 01.JPG | Diego Delso | CC BY-SA 4.0 |
| Nazca — Ceramica policroma | (Auch) Bol décoré d'une frise d'oiseaux (culture Nazca) - Musée des Amériques – Auch.jpg | Didier Descouens | Public domain |
| Moche — Huacas del Sol y de la Luna | Huaca de la Luna - Août 2007.jpg | Martin St-Amant (S23678) | CC BY 3.0 |
| Moche — Senor de Sipan | Tomb of Lord of Sipán 03.jpg | Bernard Gagnon | CC BY-SA 3.0 |
| Chavin — Lanzon Monolitico | El-lanzon.JPG | Reto Luescher | CC BY 2.5 |
| Chavin — Cabezas clavas | Cabeza clava 08 06122009.jpg | Dtarazona | CC BY-SA 3.0 |
| Paracas — Trepanaciones craneanas | Top of a skull and instrument. Wellcome M0003706.jpg | Wellcome Collection | CC BY 4.0 |
| Paracas — Necropolis de Wari Kayan | Mummy bundle mask, painted plain weave cotton, Paracas style, Cerror Uhle, Ica Valley, Peru - Peruvian fabric in the American Museum of Natural History - DSC06144.JPG | Daderot | CC0 |
| Wari — Complejo arqueologico Wari | Complejo Arqueológico Wari.jpg | Rodrigo Alomía Díaz | CC BY-SA 4.0 |
| Wari — Pikillacta | Piquillacta, Cusco, Peru.jpg | Charlesdarling | CC0 |
| Inca — Qhapaq Nan | Qhapaq Ñan Chinchaysuyo,MAR 2026.jpg | JEAMpisho | CC BY 4.0 |
| Inca — Quipus | 52 Quipu Inca Larco Museum Lima Peru 1840.jpg | bobistraveling | CC BY 2.0 |

Enlaces a los archivos originales en commons.wikimedia.org (buscar por el nombre de archivo de la tabla) para ver la licencia completa y la atribución exacta.
