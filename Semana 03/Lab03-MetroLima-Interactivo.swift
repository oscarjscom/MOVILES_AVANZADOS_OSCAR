import Foundation

// ===== LAB 03: CONSULTA DE ESTACIONES - METRO DE LIMA (version interactiva) =====
// Esta version corre en Terminal con "swift Lab03-MetroLima-Interactivo.swift"
// porque readLine() SI funciona ahi (en el Playground de Xcode no funciona).
// Docente: Juan León

// ===== DATOS =====

// Guarda los datos de conectividad y accesibilidad de una estacion.
struct InfoEstacion {
    let lineas: [String]
    let tieneAscensor: Bool
    let conexion: String?
}

// Diccionario principal: clave = nombre de estacion, valor = sus datos.
// Datos reales verificados: Linea 1 (28 estaciones), Linea 2 (5 en operacion), Metropolitano (seleccion verificada).
// OJO: "Angamos" y "Veintiocho de Julio" existen en mas de un sistema, en ubicaciones DISTINTAS,
// por eso se diferencian con el sistema entre parentesis.
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

// RF15: lugares cercanos a cada estacion. Dato ilustrativo salvo los casos marcados como verificados.
let puntosDeInteresCercanos: [String: [String]] = [
    "La Cultura": ["Museo de la Nacion"],
    "Estadio Nacional": ["Estadio Nacional del Peru", "Campo de Marte"],
    "Gamarra": ["Emporio Comercial Gamarra"],
    "Atocongo": ["Real Plaza Atocongo"]
]

// Diccionario aparte para destinos de interes que no son estaciones en si mismas.
let destinosDeInteres: [String: (sistema: String, estacion: String)] = [
    "Estadio Nacional del Peru": (sistema: "Metropolitano", estacion: "Estadio Nacional"),
    "Museo de la Nacion": (sistema: "Linea 1", estacion: "La Cultura"),
    "Emporio Comercial Gamarra": (sistema: "Linea 1", estacion: "Gamarra"),
    "Campo de Marte": (sistema: "Metropolitano", estacion: "Estadio Nacional"),
    "Real Plaza Atocongo": (sistema: "Linea 1", estacion: "Atocongo")
]

// Registro de lineas/sistemas existentes, para poder "crear una linea nueva" de forma explicita.
var lineasExistentes: Set<String> = ["Linea 1", "Linea 2", "Metropolitano"]

// ===== CONSULTAS (RF01, RF02, RF03, RF04, RF05, RF06, RF15, RF16) =====

// RF01 + RF03 + RF04: busca una estacion por nombre y muestra linea, ascensor y conexion.
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
        // RF06: si la clave no existe en el diccionario, se informa el error.
        print("Error: la estacion \"\(nombre)\" no existe en el sistema")
    }
}

// RF02: lista todas las estaciones que pertenecen a una linea o sistema dado.
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

// RF05: busca un destino de interes (no necesariamente el nombre exacto de una estacion).
func buscarPorDestino(destino: String) {
    if let info = destinosDeInteres[destino] {
        print("Para ir a \"\(destino)\", toma: \(info.sistema), estacion \(info.estacion)")
    } else {
        print("No tengo informacion registrada sobre \"\(destino)\"")
    }
}

// RF15: muestra los lugares cercanos registrados para una estacion dada.
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

// RF08: sugiere una ruta entre dos estaciones, indicando si hace falta trasbordo.
func sugerirRuta(origen: String, destino: String) {
    guard let infoOrigen = estaciones[origen] else {
        print("Error: la estacion de origen \"\(origen)\" no existe")
        return
    }
    guard let infoDestino = estaciones[destino] else {
        print("Error: la estacion de destino \"\(destino)\" no existe")
        return
    }

    let lineasComunes = Set(infoOrigen.lineas).intersection(infoDestino.lineas)
    if let lineaComun = lineasComunes.first {
        print("Ruta: \(origen) -> \(destino), directo por \(lineaComun). Sin trasbordo.")
        return
    }

    for nombreEstacion in estaciones.keys.sorted() {
        let info = estaciones[nombreEstacion]!
        guard let conexion = info.conexion else { continue }

        let compartenLineaConOrigen = !Set(info.lineas).isDisjoint(with: infoOrigen.lineas)
        let conexionLlegaADestino = infoDestino.lineas.contains(conexion)
        let compartenLineaConDestino = !Set(info.lineas).isDisjoint(with: infoDestino.lineas)
        let conexionLlegaAOrigen = infoOrigen.lineas.contains(conexion)

        if (compartenLineaConOrigen && conexionLlegaADestino) || (compartenLineaConDestino && conexionLlegaAOrigen) {
            print("Ruta: \(origen) -> \(nombreEstacion) (trasbordo) -> \(destino).")
            return
        }
    }

    print("No se encontro una ruta directa ni con trasbordo conocido entre \(origen) y \(destino).")
}

// RF16: lista todas las estaciones disponibles, para no tener que memorizarlas.
// Se imprime una por linea (en vez de todas juntas) para que sea facil de leer en la Terminal.
func listarTodasLasEstaciones() {
    print("Estaciones disponibles:")
    for nombre in estaciones.keys.sorted() {
        print("  - \(nombre)")
    }
}

// RF14: lista todas las lineas/sistemas registrados actualmente.
func listarLineas() {
    print("Lineas registradas: \(lineasExistentes.sorted().joined(separator: ", "))")
}

// ===== TARJETA DE TRANSPORTE (RF09, RF10, RF11) =====

// Representa el saldo de la tarjeta del usuario.
struct TarjetaTransporte {
    var saldo: Double
}

// Tarjeta de ejemplo, con saldo inicial.
var miTarjeta = TarjetaTransporte(saldo: 20.0)

// Tarifa fija de ejemplo para cada viaje.
let tarifaPasaje = 2.50

// RF09: muestra el saldo actual de la tarjeta.
func consultarSaldo() {
    print("Saldo actual: S/. \(String(format: "%.2f", miTarjeta.saldo))")
}

// RF10: recarga saldo a la tarjeta, validando que el monto sea valido.
func recargarSaldo(monto: Double) {
    if monto <= 0 {
        print("Error: el monto de recarga debe ser mayor a 0")
        return
    }
    miTarjeta.saldo += monto
    print("Recarga exitosa de S/. \(String(format: "%.2f", monto))")
    consultarSaldo()
}

// RF11: cobra el pasaje si hay saldo suficiente, si no muestra error.
func cobrarPasaje() {
    if miTarjeta.saldo >= tarifaPasaje {
        miTarjeta.saldo -= tarifaPasaje
        print("Pasaje cobrado: S/. \(String(format: "%.2f", tarifaPasaje))")
        consultarSaldo()
    } else {
        print("Error: saldo insuficiente para pagar el pasaje (necesitas S/. \(String(format: "%.2f", tarifaPasaje)))")
    }
}

// ===== MODO ADMINISTRADOR (RF12, RF13) =====

// RF12: agrega una estacion nueva a una linea; si la linea no existe, la crea automaticamente.
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

// RF13: crea una linea nueva vacia (sin estaciones todavia), lista para agregarle estaciones despues.
func crearLineaNueva(nombre: String) {
    if lineasExistentes.contains(nombre) {
        print("Error: la linea \"\(nombre)\" ya existe")
    } else {
        lineasExistentes.insert(nombre)
        print("Linea \"\(nombre)\" creada")
    }
}

// ===== MENU INTERACTIVO REAL (con readLine, solo funciona en Terminal) =====

// Imprime un mensaje sin salto de linea y lee la respuesta escrita por el usuario.
func pedirTexto(_ mensaje: String) -> String {
    print(mensaje, terminator: "> ")
    return readLine() ?? ""
}

// Igual que pedirTexto, pero convierte la respuesta a numero (0.0 si no es un numero valido).
func pedirNumero(_ mensaje: String) -> Double {
    print(mensaje, terminator: "> ")
    return Double(readLine() ?? "") ?? 0.0
}

// Submenu de administracion (opcion 6 del menu principal).
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

// Menu principal de la aplicacion (RF07).
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
        7. Sugerir ruta entre dos estaciones
        8. Salir
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
            print("Destinos de interes registrados:")
            for nombre in destinosDeInteres.keys.sorted() {
                print("  - \(nombre)")
            }
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
            listarTodasLasEstaciones() // Muestra las opciones para no tener que memorizarlas.
            let origen = pedirTexto("Estacion de origen")
            let destino = pedirTexto("Estacion de destino")
            sugerirRuta(origen: origen, destino: destino)
        case "8":
            continuar = false
            print("Hasta luego")
        default:
            print("Opcion invalida")
        }
    }
}

// ===== PUNTO DE ENTRADA =====
iniciarApp()
