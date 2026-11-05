# Semana 11: Manejo de datos con Core Data

Laboratorio 11, parte 1 (Actividad 01): una agenda de contactos en UIKit con Storyboard que guarda los datos en el teléfono con Core Data. Recorre las cuatro operaciones del CRUD, una búsqueda con filtro y una relación de uno a muchos.

| Carpeta | Contenido |
|---|---|
| `apple_lab11_01_UIKit_CoreData/` | Proyecto de Xcode (Interface: Storyboard, Storage: Core Data) |

## Modelo de datos

Archivo `apple_lab11_01_UIKit_CoreData.xcdatamodeld`, editable en el editor visual de Xcode.

| Entidad | Atributos | Relación |
|---|---|---|
| Contacto | nombre, telefono, direccion (String) | grupo: To One → Grupo, Inverse contactos |
| Grupo | nombre (String) | contactos: To Many → Contacto, Inverse grupo, Delete Rule Nullify |

## Pantalla (Main.storyboard)

- Navigation Controller con la pantalla "Lista de Contactos - Tecsup".
- Table View fijado a los bordes con constraints, celda prototipo de estilo Subtitle con identificador `Cell`.
- Bar Button Item Add (+) conectado a la acción `agregarContacto`, y el outlet `TablaContacto` para la tabla.

## Código

| Archivo | Contenido |
|---|---|
| `AppDelegate.swift` | `persistentContainer`, que abre el archivo SQLite de la app |
| `ViewController.swift` | Contexto (`conexion`), ruta del SQLite, READ con orden por nombre, CREATE con alerta, UPDATE al tocar una fila y DELETE al deslizar |
| `ViewController+Relacion.swift` | `buscarContactos` (predicate `CONTAINS[cd]`), `probarRelacion` (crea el grupo Amigos) y `contactosDelGrupo` (predicate que recorre la relación) |

## Cómo ejecutarlo

1. Abrir `apple_lab11_01_UIKit_CoreData/apple_lab11_01_UIKit_CoreData.xcodeproj` en Xcode.
2. Elegir un simulador de iPhone y presionar **Cmd + R**.
3. Pulsar **+** para agregar contactos, tocar una fila para editarla y deslizarla a la izquierda para borrarla.
4. Detener la app y volver a ejecutarla: los contactos siguen ahí.
5. La consola muestra la ruta del archivo SQLite. Para ver los datos: `sqlite3 "RUTA" "SELECT ZNOMBRE, ZTELEFONO FROM ZCONTACTO;"`.

## Capturas

Pendientes.
