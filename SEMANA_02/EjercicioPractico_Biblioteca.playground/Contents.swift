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

// --- Plazo de prestamo segun tipo de usuario ---
func diasPlazo(paraUsuario tipo: String) -> Int {
    switch tipo {
    case "Alumno": return 7
    case "Docente": return 15
    case "Administrativo": return 10
    default: return 0
    }
}

let fechaLimite = Calendar.current.date(byAdding: .day, value: diasPlazo(paraUsuario: tipoUsuario), to: fechaPrestado)!

let diasAtraso = max(0, Calendar.current.dateComponents([.day], from: fechaLimite, to: fechaDevolucion).day ?? 0)

print("\nLibro            : \(tituloLibro)")
print("Usuario          : \(tipoUsuario)")
print("Fecha prestada   : \(mostrarFecha(fechaPrestado))")
print("Fecha limite     : \(mostrarFecha(fechaLimite))")
print("Fecha devolucion : \(mostrarFecha(fechaDevolucion))")
print("Dias de atraso   : \(diasAtraso)")
