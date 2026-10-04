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

// --- Calendario de multa progresiva ---
let multaBaseDiaria = 1.50

func multaDelDia(_ diaAtraso: Int) -> Double {
    switch diaAtraso {
    case 1...3: return multaBaseDiaria
    case 4...6: return multaBaseDiaria * 1.5
    default: return multaBaseDiaria * 2.0
    }
}

print("\nDia | Fecha    | Multa x dia | Acumulado en soles")

var multaTotal = 0.0
if diasAtraso > 0 {
    for dia in 1...diasAtraso {
        let fechaDia = Calendar.current.date(byAdding: .day, value: dia, to: fechaLimite)!
        let multaDia = multaDelDia(dia)
        multaTotal += multaDia
        print("\(dia)   | \(mostrarFecha(fechaDia)) | \(String(format: "%.2f", multaDia))        | \(String(format: "%.2f", multaTotal))")
    }
}

// --- Resultado ---
let usuarioSuspendido = diasAtraso >= 10
let estado = diasAtraso > 0 ? "Devuelto con atraso" : "Devuelto a tiempo"
let situacion = usuarioSuspendido ? "Usuario suspendido" : "Usuario habilitado"

print("\nMulta total: \(String(format: "%.2f", multaTotal)) (es simulado)")
print("Estado: \(estado)")
print("Situacion: \(situacion)")
