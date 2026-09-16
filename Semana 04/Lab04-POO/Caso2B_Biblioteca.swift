import Foundation

// ===== CASO 2 - PARTE B: BIBLIOTECA (CON IA) =====
// Docente: Juan León

// Enum que representa los dos estados posibles de un libro.
enum EstadoLibro {
    case disponible // El libro esta en la biblioteca, se puede prestar.
    case prestado // El libro esta en manos de un lector, no se puede volver a prestar.
}

// Struct que modela un libro: es un valor, por eso se copia al pasarlo o guardarlo.
struct Libro {
    let titulo: String // Titulo del libro, no cambia despues de crearlo.
    let autor: String // Autor del libro, no cambia despues de crearlo.
    var estado: EstadoLibro = .disponible // Todo libro nuevo empieza disponible.
}

// Class que administra la coleccion de libros: es una referencia, todos comparten la misma instancia.
class Biblioteca {
    var libros: [Libro] = [] // Arreglo de libros de la biblioteca, empieza vacio.

    // Agrega un libro nuevo al final del arreglo.
    func agregar(libro: Libro) {
        libros.append(libro) // Inserta el libro recibido al final de la lista.
    }

    // Intenta prestar un libro por titulo; devuelve true si lo logro, false si no.
    func prestar(titulo: String) -> Bool {
        // Recorremos el arreglo por indice para poder modificar el struct guardado en esa posicion.
        for i in 0..<libros.count {
            // Comparamos el titulo del libro en la posicion i con el titulo buscado.
            if libros[i].titulo == titulo {
                // Si el libro existe, revisamos si esta disponible para prestarlo.
                if libros[i].estado == .disponible {
                    libros[i].estado = .prestado // Modifica el struct DENTRO del array (una copia no serviria).
                    print("Préstamo aprobado: \(titulo)") // Avisa que el prestamo se aprobo.
                    return true // Indica que la operacion tuvo exito.
                } else {
                    print("Error: \(titulo) ya está prestado") // El libro ya estaba prestado por otra persona.
                    return false // La operacion no se pudo completar.
                }
            }
        }
        // Si el for termino sin encontrar el titulo, el libro no existe en la biblioteca.
        print("Error: no existe \(titulo)") // Informa que el titulo no esta registrado.
        return false // La operacion no se pudo completar porque no existe.
    }

    // Intenta devolver un libro por titulo; devuelve true si lo logro, false si no.
    func devolver(titulo: String) -> Bool {
        // Recorremos el arreglo por indice, igual que en prestar, para poder editar el struct.
        for i in 0..<libros.count {
            // Comparamos el titulo del libro en la posicion i con el titulo buscado.
            if libros[i].titulo == titulo {
                // Solo se puede devolver un libro que este marcado como prestado.
                if libros[i].estado == .prestado {
                    libros[i].estado = .disponible // Vuelve a marcar el libro como disponible.
                    print("Devolución registrada: \(titulo)") // Confirma que la devolucion se registro.
                    return true // Indica que la operacion tuvo exito.
                } else {
                    print("Error: \(titulo) no estaba prestado") // No tiene sentido devolver algo que no se presto.
                    return false // La operacion no se pudo completar.
                }
            }
        }
        // Si no se encontro el titulo en el arreglo, el libro no existe.
        print("Error: no existe \(titulo)") // Informa que el titulo no esta registrado.
        return false // La operacion no se pudo completar porque no existe.
    }

    // Imprime el estado actual de todos los libros de la biblioteca.
    func inventario() {
        print("===== INVENTARIO =====") // Encabezado del reporte de inventario.
        // Recorremos cada libro del arreglo (aqui no necesitamos el indice porque solo leemos).
        for libro in libros {
            // Usamos switch para traducir el enum a un texto legible, como pide el enunciado.
            switch libro.estado {
            case .disponible:
                print("\(libro.titulo) (\(libro.autor)) - disponible") // Linea de libro disponible.
            case .prestado:
                print("\(libro.titulo) (\(libro.autor)) - prestado") // Linea de libro prestado.
            }
        }
    }
}

// Creamos la biblioteca que vamos a usar en la simulacion.
let biblioteca = Biblioteca()

// Agregamos los tres libros de la salida esperada, en el mismo orden.
biblioteca.agregar(libro: Libro(titulo: "Cien años de soledad", autor: "Gabriel García Márquez"))
biblioteca.agregar(libro: Libro(titulo: "La ciudad y los perros", autor: "Mario Vargas Llosa"))
biblioteca.agregar(libro: Libro(titulo: "El Quijote", autor: "Miguel de Cervantes"))

// Prestamos "La ciudad y los perros": debe quedar prestado.
biblioteca.prestar(titulo: "La ciudad y los perros")

// Intentamos prestarlo de nuevo: debe fallar porque ya esta prestado.
biblioteca.prestar(titulo: "La ciudad y los perros")

// Devolvemos "La ciudad y los perros": debe quedar disponible otra vez.
biblioteca.devolver(titulo: "La ciudad y los perros")

// Prestamos "El Quijote": debe quedar prestado.
biblioteca.prestar(titulo: "El Quijote")

// Intentamos prestar "El Principito", que no esta registrado: debe mostrar el error de que no existe.
biblioteca.prestar(titulo: "El Principito")

// Mostramos el inventario final con el estado de cada libro.
biblioteca.inventario()
