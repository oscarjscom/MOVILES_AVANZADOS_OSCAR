import Foundation

// --- Ingreso de datos ---
let tituloLibro = "Estructuras de Datos en Swift"
let tipoUsuario = "Alumno"

let formatoFecha = DateFormatter()
formatoFecha.dateFormat = "dd/MM/yyyy"

let fechaPrestado = formatoFecha.date(from: "10/10/2026")!
let fechaDevolucion = formatoFecha.date(from: "21/10/2026")!

func mostrarFecha(_ fecha: Date) -> String {
    let f = DateFormatter()
    f.dateFormat = "dd/MM/yy"
    return f.string(from: fecha)
}

print("Titulo libro     : \(tituloLibro)")
print("Tipo de Usuario  : \(tipoUsuario)")
print("Fecha prestado   : \(mostrarFecha(fechaPrestado))")
print("Fecha devolucion : \(mostrarFecha(fechaDevolucion))")
