import Foundation

// ===== LAB 03: CONSULTA DE ESTACIONES - METRO DE LIMA (asistido por IA) =====
// Docente: Juan León

// Guarda los datos de conectividad y accesibilidad de una estacion.
struct InfoEstacion {
    let lineas: [String] // una estacion puede pertenecer a mas de un sistema/linea
    let tieneAscensor: Bool // dato ilustrativo, no verificado estacion por estacion
    let conexion: String? // nil si no es una estacion intermodal
}

// Diccionario principal: clave = nombre de estacion, valor = sus datos.
// Datos reales verificados: Linea 1 (operativa, 27 estaciones), Linea 2 (5 estaciones
// en operacion desde 2023: Evitamiento a Mercado Santa Anita), Metropolitano (BRT).
// Conexiones intermodales reales: Atocongo y Nicolas Ayllon conectan Metropolitano con Linea 1.
let estaciones: [String: InfoEstacion] = [
    "Villa El Salvador": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Atocongo": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: "Metropolitano"),
    "Angamos": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Gamarra": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: false, conexion: nil),
    "Miguel Grau": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Bayovar": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Evitamiento": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Mercado Santa Anita": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Nicolas Ayllon": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: "Linea 1"),
    "Estadio Nacional": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil)
]

// Diccionario aparte para destinos de interes que no son estaciones en si mismas.
// Ejemplo: alguien quiere llegar a un lugar, no sabe el nombre exacto de la estacion.
let destinosDeInteres: [String: (sistema: String, estacion: String)] = [
    "Estadio Nacional del Peru": (sistema: "Metropolitano", estacion: "Estadio Nacional")
]

// RF01 + RF03 + RF04: busca una estacion por nombre y muestra linea, ascensor y conexion.
func buscarEstacion(nombre: String) {
    // Intentamos obtener la info de la estacion desde el diccionario.
    if let info = estaciones[nombre] {
        print("Estacion: \(nombre)") // Muestra el nombre buscado.
        print("Linea(s): \(info.lineas.joined(separator: ", "))") // Une el array de lineas en un solo texto.
        print("Ascensor: \(info.tieneAscensor ? "Si" : "No")") // Traduce el Bool a un texto legible.
        if let conexion = info.conexion {
            print("Conecta con: \(conexion)") // Muestra el sistema con el que es intermodal.
        } else {
            print("No tiene conexion directa registrada con otro sistema") // No es estacion intermodal.
        }
    } else {
        // RF06: si la clave no existe en el diccionario, se informa el error.
        print("Error: la estacion \"\(nombre)\" no existe en el sistema")
    }
}

// RF02: lista todas las estaciones que pertenecen a una linea o sistema dado.
func listarPorLinea(linea: String) {
    // Filtramos el diccionario dejando solo las estaciones que contienen esa linea.
    let resultado = estaciones.filter { $0.value.lineas.contains(linea) }
    if resultado.isEmpty {
        print("No se encontraron estaciones para \"\(linea)\"") // No hay coincidencias.
    } else {
        print("Estaciones de \(linea):")
        // Ordenamos alfabeticamente para que la salida sea consistente.
        for nombre in resultado.keys.sorted() {
            print("- \(nombre)") // Imprime cada estacion encontrada.
        }
    }
}

// RF05: busca un destino de interes (no necesariamente el nombre exacto de una estacion).
func buscarPorDestino(destino: String) {
    // Buscamos el destino en el diccionario de lugares de interes.
    if let info = destinosDeInteres[destino] {
        print("Para ir a \"\(destino)\", toma: \(info.sistema), estacion \(info.estacion)")
    } else {
        print("No tengo informacion registrada sobre \"\(destino)\"") // Destino no mapeado.
    }
}

// ===== SIMULACION DE CONSULTAS =====
// El Playground no soporta entrada real por consola, asi que se simula con llamadas directas.

print("--- RF01/RF03/RF04: estacion normal ---")
buscarEstacion(nombre: "Miguel Grau")

print("\n--- RF01/RF03/RF04: estacion intermodal ---")
buscarEstacion(nombre: "Atocongo")

print("\n--- RF02: listar por linea ---")
listarPorLinea(linea: "Linea 1")

print("\n--- RF05: buscar por destino de interes ---")
buscarPorDestino(destino: "Estadio Nacional del Peru")

print("\n--- RF06: estacion inexistente ---")
buscarEstacion(nombre: "Estacion Inventada")
