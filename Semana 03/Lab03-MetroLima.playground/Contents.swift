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
// Datos reales verificados: Linea 1 (operativa, 28 estaciones), Linea 2 (5 estaciones
// en operacion desde 2023: Evitamiento a Mercado Santa Anita), Metropolitano (BRT, corredor troncal).
// Conexiones intermodales reales: Atocongo y Nicolas Ayllon conectan Metropolitano con Linea 1.
// OJO: "Angamos" y "Veintiocho de Julio" existen en mas de un sistema, en ubicaciones DISTINTAS,
// por eso se diferencian con el sistema entre parentesis (no son la misma estacion fisica).
// Es var (no let) porque el modo administrador necesita poder agregar estaciones nuevas.
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

// RF16: lista todas las estaciones disponibles, para no tener que memorizarlas.
func listarTodasLasEstaciones() {
    print("Estaciones disponibles: \(estaciones.keys.sorted().joined(separator: ", "))")
}

// RF15: lugares cercanos a cada estacion. Dato ilustrativo salvo los casos marcados como verificados.
let puntosDeInteresCercanos: [String: [String]] = [
    "La Cultura": ["Museo de la Nacion"], // Verificado: la estacion esta junto al Museo de la Nacion.
    "Estadio Nacional": ["Estadio Nacional del Peru", "Campo de Marte"], // Verificado: da nombre a la estacion.
    "Gamarra": ["Emporio Comercial Gamarra"], // Verificado: zona comercial textil mas grande del Peru.
    "Atocongo": ["Real Plaza Atocongo"] // Ilustrativo: centro comercial cercano a la estacion.
]

// Diccionario aparte para destinos de interes que no son estaciones en si mismas.
// Ejemplo: alguien quiere llegar a un lugar, no sabe el nombre exacto de la estacion.
let destinosDeInteres: [String: (sistema: String, estacion: String)] = [
    "Estadio Nacional del Peru": (sistema: "Metropolitano", estacion: "Estadio Nacional"),
    "Museo de la Nacion": (sistema: "Linea 1", estacion: "La Cultura"), // Verificado: junto a la estacion.
    "Emporio Comercial Gamarra": (sistema: "Linea 1", estacion: "Gamarra"), // Verificado: da nombre a la estacion.
    "Campo de Marte": (sistema: "Metropolitano", estacion: "Estadio Nacional"), // Verificado: cerca de la estacion.
    "Real Plaza Atocongo": (sistema: "Linea 1", estacion: "Atocongo") // Ilustrativo: centro comercial cercano.
]

// Registro de lineas/sistemas existentes, para poder "crear una linea nueva" de forma explicita.
var lineasExistentes: Set<String> = ["Linea 1", "Linea 2", "Metropolitano"]

// ===== TARJETA DE TRANSPORTE (RF09, RF10, RF11) =====

// Representa el saldo de la tarjeta del usuario.
struct TarjetaTransporte {
    var saldo: Double
}

// Tarjeta de ejemplo para la simulacion, con saldo inicial.
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
        print("Error: el monto de recarga debe ser mayor a 0") // Evita recargas invalidas.
        return
    }
    miTarjeta.saldo += monto // Suma el monto recargado al saldo actual.
    print("Recarga exitosa de S/. \(String(format: "%.2f", monto))")
    consultarSaldo() // Muestra el saldo actualizado.
}

// RF11: cobra el pasaje si hay saldo suficiente, si no muestra error.
func cobrarPasaje() {
    if miTarjeta.saldo >= tarifaPasaje {
        miTarjeta.saldo -= tarifaPasaje // Descuenta la tarifa del saldo.
        print("Pasaje cobrado: S/. \(String(format: "%.2f", tarifaPasaje))")
        consultarSaldo() // Muestra el saldo restante.
    } else {
        print("Error: saldo insuficiente para pagar el pasaje (necesitas S/. \(String(format: "%.2f", tarifaPasaje)))")
    }
}

// ===== MODO ADMINISTRADOR (RF12, RF13, RF14) =====

// RF12: agrega una estacion nueva a una linea; si la linea no existe, la crea automaticamente.
func agregarEstacion(nombre: String, linea: String, tieneAscensor: Bool, conexion: String?) {
    if estaciones[nombre] != nil {
        print("Error: la estacion \"\(nombre)\" ya existe") // Evita duplicar estaciones.
        return
    }
    if !lineasExistentes.contains(linea) {
        lineasExistentes.insert(linea) // Registra la linea nueva si todavia no existia.
        print("Se creo una nueva linea: \(linea)")
    }
    estaciones[nombre] = InfoEstacion(lineas: [linea], tieneAscensor: tieneAscensor, conexion: conexion)
    print("Estacion \"\(nombre)\" agregada a \(linea)")
}

// RF13: crea una linea nueva vacia (sin estaciones todavia), lista para agregarle estaciones despues.
func crearLineaNueva(nombre: String) {
    if lineasExistentes.contains(nombre) {
        print("Error: la linea \"\(nombre)\" ya existe") // Evita duplicar lineas.
    } else {
        lineasExistentes.insert(nombre) // Agrega la linea nueva al registro.
        print("Linea \"\(nombre)\" creada")
    }
}

// RF14: lista todas las lineas/sistemas registrados actualmente.
func listarLineas() {
    print("Lineas registradas: \(lineasExistentes.sorted().joined(separator: ", "))")
}

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
    // OJO: filter sobre un diccionario devuelve un array de tuplas (key, value), no un diccionario.
    let resultado = estaciones.filter { $0.value.lineas.contains(linea) }
    if resultado.isEmpty {
        print("No se encontraron estaciones para \"\(linea)\"") // No hay coincidencias.
    } else {
        print("Estaciones de \(linea):")
        // Ordenamos alfabeticamente para que la salida sea consistente.
        for nombre in resultado.map({ $0.key }).sorted() {
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

// RF15: muestra los lugares cercanos registrados para una estacion dada.
func verPuntosDeInteres(estacion: String) {
    // Primero verificamos que la estacion exista, para no confundir "no existe" con "no tiene lugares".
    if estaciones[estacion] == nil {
        print("Error: la estacion \"\(estacion)\" no existe en el sistema")
        return
    }
    if let lugares = puntosDeInteresCercanos[estacion], !lugares.isEmpty {
        print("Cerca de \(estacion) encontraras: \(lugares.joined(separator: ", "))")
    } else {
        print("No tengo lugares registrados cerca de \(estacion)") // Existe la estacion pero sin datos de lugares.
    }
}

// RF08: sugiere una ruta entre dos estaciones, indicando si hace falta trasbordo.
func sugerirRuta(origen: String, destino: String) {
    // Verificamos que ambas estaciones existan antes de intentar armar una ruta.
    guard let infoOrigen = estaciones[origen] else {
        print("Error: la estacion de origen \"\(origen)\" no existe")
        return
    }
    guard let infoDestino = estaciones[destino] else {
        print("Error: la estacion de destino \"\(destino)\" no existe")
        return
    }

    // Si ambas estaciones comparten al menos una linea/sistema, se llega directo sin trasbordo.
    let lineasComunes = Set(infoOrigen.lineas).intersection(infoDestino.lineas)
    if let lineaComun = lineasComunes.first {
        print("Ruta: \(origen) -> \(destino), directo por \(lineaComun). Sin trasbordo.")
        return
    }

    // Si no comparten linea, buscamos una estacion intermodal que conecte ambos sistemas.
    // Se recorre en orden alfabetico para que el resultado sea siempre el mismo.
    for nombreEstacion in estaciones.keys.sorted() {
        let info = estaciones[nombreEstacion]! // Sabemos que existe porque viene de las claves del diccionario.
        guard let conexion = info.conexion else { continue } // Solo nos interesan las estaciones intermodales.

        let compartenLineaConOrigen = !Set(info.lineas).isDisjoint(with: infoOrigen.lineas)
        let conexionLlegaADestino = infoDestino.lineas.contains(conexion)
        let compartenLineaConDestino = !Set(info.lineas).isDisjoint(with: infoDestino.lineas)
        let conexionLlegaAOrigen = infoOrigen.lineas.contains(conexion)

        // La estacion intermodal sirve como trasbordo si conecta el lado del origen con el del destino, o viceversa.
        if (compartenLineaConOrigen && conexionLlegaADestino) || (compartenLineaConDestino && conexionLlegaAOrigen) {
            print("Ruta: \(origen) -> \(nombreEstacion) (trasbordo) -> \(destino).")
            return
        }
    }

    // Si no se encontro ninguna conexion conocida entre los dos sistemas, se informa al usuario.
    print("No se encontro una ruta directa ni con trasbordo conocido entre \(origen) y \(destino).")
}

// RF07: imprime el diseño del menu (no interactivo, el Playground no soporta readLine real).
func mostrarMenu() {
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
}

// Sub-menu de la seccion de administracion.
func mostrarMenuAdmin() {
    print("""
    --- Seccion Administracion ---
    6.1 Agregar estacion (a una linea existente o una linea nueva)
    6.2 Crear una linea nueva vacia
    6.3 Listar lineas registradas
    """)
}

// ===== SIMULACION DE CONSULTAS =====
// El Playground no soporta entrada real por consola, asi que se simula con llamadas directas.

mostrarMenu()

print("\n--- RF16: ver todas las estaciones disponibles ---")
listarTodasLasEstaciones()

print("\n--- RF01/RF03/RF04: estacion normal ---")
buscarEstacion(nombre: "Miguel Grau")

print("\n--- RF01/RF03/RF04: estacion intermodal ---")
buscarEstacion(nombre: "Atocongo")

print("\n--- RF02: listar por linea ---")
listarPorLinea(linea: "Linea 1")

print("\n--- RF05: buscar por destino de interes ---")
buscarPorDestino(destino: "Estadio Nacional del Peru")

print("\n--- RF06: estacion inexistente ---")
buscarEstacion(nombre: "Estacion Inventada")

print("\n--- RF15: lugares cercanos a una estacion (con datos registrados) ---")
verPuntosDeInteres(estacion: "Estadio Nacional")

print("\n--- RF15: lugares cercanos a una estacion (sin datos registrados) ---")
verPuntosDeInteres(estacion: "Bayovar")

print("\n--- RF15: lugares cercanos a una estacion inexistente ---")
verPuntosDeInteres(estacion: "Estacion Inventada")

print("\n--- RF09/RF10: tarjeta de transporte, saldo y recarga ---")
consultarSaldo()
recargarSaldo(monto: 10.0)

print("\n--- RF11: cobro de pasaje (con saldo suficiente) ---")
cobrarPasaje()

print("\n--- RF11: cobro de pasaje sin saldo suficiente ---")
miTarjeta.saldo = 1.0 // Forzamos un saldo bajo para probar el caso de error.
cobrarPasaje()

print("\n" + String(repeating: "-", count: 3) + " Modo administrador " + String(repeating: "-", count: 3))
mostrarMenuAdmin()

print("\n--- RF12: agregar estacion a una linea EXISTENTE ---")
agregarEstacion(nombre: "Chorrillos", linea: "Linea 1", tieneAscensor: true, conexion: nil)

print("\n--- RF12/RF13: agregar estacion creando una linea NUEVA ---")
agregarEstacion(nombre: "Callao Centro", linea: "Linea 4", tieneAscensor: false, conexion: nil)

print("\n--- RF13: crear una linea nueva vacia ---")
crearLineaNueva(nombre: "Linea 3")

print("\n--- RF14: listar lineas registradas ---")
listarLineas()

print("\n--- Verificando la estacion agregada ---")
buscarEstacion(nombre: "Chorrillos")

print("\n--- RF08: ruta directa, sin trasbordo (misma linea) ---")
sugerirRuta(origen: "Miguel Grau", destino: "Bayovar")

print("\n--- RF08: ruta con trasbordo (Linea 1 -> Metropolitano) ---")
sugerirRuta(origen: "Miguel Grau", destino: "Estadio Nacional")

print("\n--- RF08: sin ruta conocida entre sistemas (Linea 2 -> Linea 1) ---")
sugerirRuta(origen: "Evitamiento", destino: "Miguel Grau")
