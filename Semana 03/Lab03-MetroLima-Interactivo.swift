import Foundation

// ===== LAB 03: CONSULTA DE ESTACIONES - METRO DE LIMA (version interactiva) =====
// Esta version corre en Terminal con "swift Lab03-MetroLima-Interactivo.swift"
// porque readLine() SI funciona ahi (en el Playground de Xcode no funciona).

struct InfoEstacion {
    let lineas: [String]
    let tieneAscensor: Bool
    let conexion: String?
}

var estaciones: [String: InfoEstacion] = [
    // --- Linea 1 (28 estaciones) ---
    "Villa El Salvador": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Parque Industrial": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Pumacahua": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Villa Maria": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Maria Auxiliadora": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "San Juan": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Atocongo": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: "Metropolitano"),
    "Jorge Chavez": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Ayacucho": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Cabitos": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Angamos (Linea 1)": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "San Borja Sur": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "La Cultura": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Arriola": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Gamarra": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: false, conexion: nil),
    "Veintiocho de Julio (Linea 1)": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Miguel Grau": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "El Angel": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Presbitero Maestro": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Rio Rimac": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Caja de Agua": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Piramide del Sol": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Los Jardines": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Los Postes": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "San Carlos": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "San Martin": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Santa Rosa": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),
    "Bayovar": InfoEstacion(lineas: ["Linea 1"], tieneAscensor: true, conexion: nil),

    // --- Linea 2 (5 estaciones en operacion) ---
    "Evitamiento": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Ovalo Santa Anita": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Colectora Industrial": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Hermilio Valdizan": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),
    "Mercado Santa Anita": InfoEstacion(lineas: ["Linea 2"], tieneAscensor: true, conexion: nil),

    // --- Metropolitano (corredor troncal, seleccion de estaciones verificadas) ---
    "Nicolas Ayllon": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: "Linea 1"),
    "Naranjal": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Tomas Valle": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Honorio Delgado": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "UNI": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Caqueta": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Estacion Central": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Colmena": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Espana": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Abancay": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Estadio Nacional": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Mexico": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Javier Prado": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Canaval y Moreyra": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Angamos (Metropolitano)": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Ricardo Palma": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Benavides": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Veintiocho de Julio (Metropolitano)": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Surco": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil),
    "Matellini": InfoEstacion(lineas: ["Metropolitano"], tieneAscensor: true, conexion: nil)
]

func listarTodasLasEstaciones() {
    print("Estaciones disponibles: \(estaciones.keys.sorted().joined(separator: ", "))")
}

let puntosDeInteresCercanos: [String: [String]] = [
    "La Cultura": ["Museo de la Nacion"],
    "Estadio Nacional": ["Estadio Nacional del Peru", "Campo de Marte"],
    "Gamarra": ["Emporio Comercial Gamarra"],
    "Atocongo": ["Real Plaza Atocongo"]
]

let destinosDeInteres: [String: (sistema: String, estacion: String)] = [
    "Estadio Nacional del Peru": (sistema: "Metropolitano", estacion: "Estadio Nacional")
]

var lineasExistentes: Set<String> = ["Linea 1", "Linea 2", "Metropolitano"]

struct TarjetaTransporte {
    var saldo: Double
}
var miTarjeta = TarjetaTransporte(saldo: 20.0)
let tarifaPasaje = 2.50

func consultarSaldo() {
    print("Saldo actual: S/. \(String(format: "%.2f", miTarjeta.saldo))")
}

func recargarSaldo(monto: Double) {
    if monto <= 0 {
        print("Error: el monto de recarga debe ser mayor a 0")
        return
    }
    miTarjeta.saldo += monto
    print("Recarga exitosa de S/. \(String(format: "%.2f", monto))")
    consultarSaldo()
}

func cobrarPasaje() {
    if miTarjeta.saldo >= tarifaPasaje {
        miTarjeta.saldo -= tarifaPasaje
        print("Pasaje cobrado: S/. \(String(format: "%.2f", tarifaPasaje))")
        consultarSaldo()
    } else {
        print("Error: saldo insuficiente para pagar el pasaje (necesitas S/. \(String(format: "%.2f", tarifaPasaje)))")
    }
}

func agregarEstacion(nombre: String, linea: String, tieneAscensor: Bool, conexion: String?) {
    if estaciones[nombre] != nil {
        print("Error: la estacion \"\(nombre)\" ya existe")
        return
    }
    if !lineasExistentes.contains(linea) {
        lineasExistentes.insert(linea)
        print("Se creo una nueva linea: \(linea)")
    }
    estaciones[nombre] = InfoEstacion(lineas: [linea], tieneAscensor: tieneAscensor, conexion: conexion)
    print("Estacion \"\(nombre)\" agregada a \(linea)")
}

func crearLineaNueva(nombre: String) {
    if lineasExistentes.contains(nombre) {
        print("Error: la linea \"\(nombre)\" ya existe")
    } else {
        lineasExistentes.insert(nombre)
        print("Linea \"\(nombre)\" creada")
    }
}

func listarLineas() {
    print("Lineas registradas: \(lineasExistentes.sorted().joined(separator: ", "))")
}

func buscarEstacion(nombre: String) {
    if let info = estaciones[nombre] {
        print("Estacion: \(nombre)")
        print("Linea(s): \(info.lineas.joined(separator: ", "))")
        print("Ascensor: \(info.tieneAscensor ? "Si" : "No")")
        if let conexion = info.conexion {
            print("Conecta con: \(conexion)")
        } else {
            print("No tiene conexion directa registrada con otro sistema")
        }
    } else {
        print("Error: la estacion \"\(nombre)\" no existe en el sistema")
    }
}

func listarPorLinea(linea: String) {
    let resultado = estaciones.filter { $0.value.lineas.contains(linea) }
    if resultado.isEmpty {
        print("No se encontraron estaciones para \"\(linea)\"")
    } else {
        print("Estaciones de \(linea):")
        for nombre in resultado.map({ $0.key }).sorted() {
            print("- \(nombre)")
        }
    }
}

func buscarPorDestino(destino: String) {
    if let info = destinosDeInteres[destino] {
        print("Para ir a \"\(destino)\", toma: \(info.sistema), estacion \(info.estacion)")
    } else {
        print("No tengo informacion registrada sobre \"\(destino)\"")
    }
}

func verPuntosDeInteres(estacion: String) {
    if estaciones[estacion] == nil {
        print("Error: la estacion \"\(estacion)\" no existe en el sistema")
        return
    }
    if let lugares = puntosDeInteresCercanos[estacion], !lugares.isEmpty {
        print("Cerca de \(estacion) encontraras: \(lugares.joined(separator: ", "))")
    } else {
        print("No tengo lugares registrados cerca de \(estacion)")
    }
}

// ===== MENU INTERACTIVO REAL (con readLine, solo funciona en Terminal) =====

func pedirTexto(_ mensaje: String) -> String {
    print(mensaje, terminator: "> ")
    return readLine() ?? ""
}

func pedirNumero(_ mensaje: String) -> Double {
    print(mensaje, terminator: "> ")
    return Double(readLine() ?? "") ?? 0.0
}

func menuAdministrador() {
    var seguir = true
    while seguir {
        print("""

        --- Seccion Administracion ---
        1. Agregar estacion
        2. Crear linea nueva vacia
        3. Listar lineas registradas
        4. Volver al menu principal
        """)
        let opcion = pedirTexto("Elige una opcion")
        switch opcion {
        case "1":
            let nombre = pedirTexto("Nombre de la nueva estacion")
            let linea = pedirTexto("Linea (existente o nueva)")
            let ascensorTexto = pedirTexto("¿Tiene ascensor? (si/no)")
            agregarEstacion(nombre: nombre, linea: linea, tieneAscensor: ascensorTexto.lowercased() == "si", conexion: nil)
        case "2":
            let nombre = pedirTexto("Nombre de la linea nueva")
            crearLineaNueva(nombre: nombre)
        case "3":
            listarLineas()
        case "4":
            seguir = false
        default:
            print("Opcion invalida")
        }
    }
}

func iniciarApp() {
    var continuar = true
    while continuar {
        print("""

        ===== METRO LIMA - CONSULTA DE ESTACIONES =====
        1. Buscar estacion por nombre
        2. Listar estaciones de una linea
        3. Buscar por destino de interes
        4. Ver lugares cercanos a una estacion
        5. Tarjeta de transporte (saldo, recarga, pasaje)
        6. Modo administrador
        7. Salir
        """)
        let opcion = pedirTexto("Elige una opcion")
        switch opcion {
        case "1":
            listarTodasLasEstaciones() // Muestra las opciones para no tener que memorizarlas.
            let nombre = pedirTexto("Nombre de la estacion")
            buscarEstacion(nombre: nombre)
        case "2":
            listarLineas() // Muestra las lineas disponibles antes de preguntar.
            let linea = pedirTexto("Linea (ej. Linea 1, Linea 2, Metropolitano)")
            listarPorLinea(linea: linea)
        case "3":
            print("Destinos de interes registrados: \(destinosDeInteres.keys.sorted().joined(separator: ", "))")
            let destino = pedirTexto("Destino de interes")
            buscarPorDestino(destino: destino)
        case "4":
            listarTodasLasEstaciones() // Muestra las opciones para no tener que memorizarlas.
            let estacion = pedirTexto("Nombre de la estacion")
            verPuntosDeInteres(estacion: estacion)
        case "5":
            print("""

            --- Tarjeta de transporte ---
            1. Consultar saldo
            2. Recargar saldo
            3. Cobrar pasaje
            """)
            let subopcion = pedirTexto("Elige una opcion")
            switch subopcion {
            case "1": consultarSaldo()
            case "2": recargarSaldo(monto: pedirNumero("Monto a recargar"))
            case "3": cobrarPasaje()
            default: print("Opcion invalida")
            }
        case "6":
            menuAdministrador()
        case "7":
            continuar = false
            print("Hasta luego")
        default:
            print("Opcion invalida")
        }
    }
}

iniciarApp()
