# Semana 11: Manejo de datos con Core Data y SwiftData

Laboratorio 11. El mismo problema resuelto con dos tecnologías: guardar datos en el teléfono, recorrer las cuatro operaciones del CRUD, buscar y relacionar dos entidades de uno a muchos.

| Carpeta | Parte | Contenido |
|---|---|---|
| `apple_lab11_01_UIKit_CoreData/` | Parte 1 | Agenda de contactos. UIKit con Storyboard y Core Data |
| `apple_lab11_02_SwiftUI_SwiftData/` | Parte 2 | Lista de alumnos. SwiftUI y SwiftData |

# Parte 1: Core Data con UIKit (Contacto)

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

## Cómo ejecutar la parte 1

1. Abrir `apple_lab11_01_UIKit_CoreData/apple_lab11_01_UIKit_CoreData.xcodeproj` en Xcode.
2. Elegir un simulador de iPhone y presionar **Cmd + R**.
3. Pulsar **+** para agregar contactos, tocar una fila para editarla y deslizarla a la izquierda para borrarla.
4. Detener la app y volver a ejecutarla: los contactos siguen ahí.
5. La consola muestra la ruta del archivo SQLite. Para ver los datos: `sqlite3 "RUTA" "SELECT ZNOMBRE, ZTELEFONO FROM ZCONTACTO;"`.

# Parte 2: SwiftData con SwiftUI (Alumno)

No hay editor de modelo, ni AppDelegate, ni `reloadData()`: el modelo son clases de Swift con `@Model` y la pantalla se actualiza sola.

## Modelo de datos

| Clase `@Model` | Propiedades | Relación |
|---|---|---|
| Alumno | idAlumno (UUID), apellido, nombre, dni (String) | curso: Curso? |
| Curso | nombre (String) | alumnos: [Alumno], `@Relationship(deleteRule: .nullify, inverse: \Alumno.curso)` |

## Código

| Archivo | Contenido |
|---|---|
| `Alumno.swift` y `Curso.swift` | Las dos clases del modelo |
| `ModelContainerProvider.swift` | Contenedor único (singleton) con el esquema y el archivo `AlumnosData.sqlite` |
| `apple_lab11_02_SwiftUI_SwiftDataApp.swift` | Conecta el contenedor a la app con `.modelContainer(...)` |
| `ContentView.swift` | READ con `@Query` ordenado por apellido, DELETE al deslizar, detalle, búsqueda con `.searchable` y botón Curso demo |
| `NuevoAlumnoView.swift` | CREATE: formulario con `modelContext.insert` y `save()` |
| `EditarAlumnoView.swift` | UPDATE: campos enlazados con `@Bindable`, SwiftData guarda el cambio solo |

## Cómo ejecutar la parte 2

1. Abrir `apple_lab11_02_SwiftUI_SwiftData/apple_lab11_02_SwiftUI_SwiftData.xcodeproj` en Xcode. Requiere iOS 17 o superior.
2. Elegir un simulador de iPhone y presionar **Cmd + R**.
3. Pulsar **+** para agregar alumnos, tocar uno para ver el detalle y **Editar**, deslizar para borrar y bajar la lista para buscar por apellido.
4. Pulsar el libro (**Curso demo**): todos los alumnos muestran "Curso: Programación en Móviles".
5. Si la app se cierra por un error de migración, borrar la app del simulador y ejecutar de nuevo.

## Capturas

Pendientes.
