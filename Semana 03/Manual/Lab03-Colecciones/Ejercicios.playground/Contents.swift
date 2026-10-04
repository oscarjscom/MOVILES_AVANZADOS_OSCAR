// Desarrollado por: Oscar Olano
// Laboratorio 03 — Colecciones: Arrays, Diccionarios y Sets
// Docente: Juan Leon — Tecsup
//
// Los ejercicios leen datos con readLine(). Para ingresarlos se ejecuta en Terminal:
//   swift Contents.swift
// (en Playground readLine() devuelve nil y todo queda en 0 / vacío).
// Cada ejercicio va en un bloque do { } para que sus variables no choquen.

import Foundation

// ===== EJERCICIO 1: ARRAYS =====
do {
    // ===== TODO 1: Registro de 5 alumnos =====
    var alumnos: [String] = []
    for i in 1...5 {
        print("Nombre del alumno \(i):")
        let nombre = readLine() ?? ""
        alumnos.append(nombre)
    }
    print("Alumnos: \(alumnos)")

    // ===== TODO 2: Buscar un alumno =====
    print("Buscar alumno:")
    let buscar = readLine() ?? ""
    if alumnos.contains(buscar) {
        print("\(buscar) está en la lista")
    } else {
        print("\(buscar) NO está en la lista")
    }

    // ===== TODO 3: Notas con clasificación =====
    var notasClase: [Double] = []
    for i in 1...5 {
        print("Nota del alumno \(i):")
        let n = Double(readLine() ?? "") ?? 0
        notasClase.append(n)
    }
    var aprobados = 0
    var desaprobados = 0
    var sumaNotas = 0.0
    for nota in notasClase {
        sumaNotas += nota
        if nota >= 13 {
            aprobados += 1
        } else {
            desaprobados += 1
        }
    }
    print("Promedio: \(sumaNotas / Double(notasClase.count))")
    print("Aprobados: \(aprobados), Desaprobados: \(desaprobados)")

    // ===== FIX: 3 errores =====
    var frutas = ["Manzana", "Plátano", "Naranja"]
    frutas.append("Uva")              // FIX 1: el array es [String]; no se puede agregar un Int (7)
    print(frutas)

    var colores = ["Rojo", "Azul", "Verde"]   // FIX 2: con let el array es inmutable; debe ser var
    colores.append("Amarillo")
    print(colores)

    let numeros = [10, 20, 30, 40, 50]
    print(numeros[4])                 // FIX 3: los índices van de 0 a 4; numeros[5] se sale del array
    print(numeros[numeros.count - 1]) //        forma segura de pedir el último elemento

    // ===== PREDICT =====
    var lista = [1, 2, 3, 4, 5]
    lista.remove(at: 0)
    lista.append(6)
    print(lista)              // PREDICT 1: [2, 3, 4, 5, 6]
    print(lista.count)        // PREDICT 2: 5

    let nombres = ["Ana", "Carlos", "Beto"]
    print(nombres.sorted())   // PREDICT 3: ["Ana", "Beto", "Carlos"]
    print(nombres)            // PREDICT 4: ["Ana", "Carlos", "Beto"] (sorted() no modifica el original)
}

// ===== EJERCICIO 2: DICCIONARIOS =====
do {
    // ===== TODO 4: Catálogo de productos =====
    var productos: [String: Double] = [:]
    for i in 1...4 {
        print("Producto \(i) - Nombre:")
        let nombre = readLine() ?? ""
        print("Precio:")
        let precio = Double(readLine() ?? "") ?? 0
        productos[nombre] = precio
    }

    // ===== TODO 5: Mostrar catálogo =====
    print("===== CATÁLOGO =====")
    for (nombre, precio) in productos {
        print("\(nombre): S/. \(precio)")
    }

    // ===== TODO 6: Valor total =====
    var valorTotal = 0.0
    for (_, precio) in productos {
        valorTotal += precio
    }
    print("Valor total: S/. \(valorTotal)")

    // ===== TODO 7: Buscar producto =====
    print("Buscar producto:")
    let buscarProd = readLine() ?? ""
    if let precioEncontrado = productos[buscarProd] {
        print("\(buscarProd) cuesta S/. \(precioEncontrado)")
    } else {
        print("Producto no encontrado")
    }

    // ===== ANALYZE =====
    let edades: [String: Int] = ["Ana": 20, "Luis": 22, "María": 19]
    var mayores: [String] = []
    for (nombre, edad) in edades {
        if edad >= 21 {
            mayores.append(nombre)
        }
    }
    print("Mayores de 21: \(mayores)")
    // ANALYZE 1: recorre el diccionario de edades y guarda en un array los nombres
    // con 21 años o más. Solo Luis (22) cumple, así que imprime: Mayores de 21: ["Luis"]
}

// ===== EJERCICIO 3: SETS =====
do {
    // ===== TODO 8: Eliminar duplicados =====
    var numeros: [Int] = []
    for i in 1...8 {
        print("Número \(i):")
        let n = Int(readLine() ?? "") ?? 0
        numeros.append(n)
    }
    print("Con duplicados: \(numeros)")
    let sinDuplicados = Array(Set(numeros)).sorted()
    print("Sin duplicados: \(sinDuplicados)")

    // ===== TODO 9: Comparar asistencia =====
    var asistioLunes: Set<String> = []
    print("===== ASISTENCIA LUNES =====")
    for i in 1...4 {
        print("Alumno \(i):")
        asistioLunes.insert(readLine() ?? "")
    }
    var asistioMartes: Set<String> = []
    print("===== ASISTENCIA MARTES =====")
    for i in 1...4 {
        print("Alumno \(i):")
        asistioMartes.insert(readLine() ?? "")
    }
    print("Ambos días: \(asistioLunes.intersection(asistioMartes).sorted())")
    print("Solo lunes: \(asistioLunes.subtracting(asistioMartes).sorted())")
    print("Solo martes: \(asistioMartes.subtracting(asistioLunes).sorted())")

    // ===== PREDICT =====
    let a: Set = [1, 2, 3, 4, 5]
    let b: Set = [4, 5, 6, 7, 8]
    print(a.intersection(b))      // PREDICT 5: [4, 5] (un Set no tiene orden, puede salir [5, 4])
    print(a.union(b).count)       // PREDICT 6: 8
    print(a.subtracting(b))       // PREDICT 7: [1, 2, 3] (en cualquier orden)

    let repetidos: Set = ["A", "B", "A", "C", "B"]
    print(repetidos.count)        // PREDICT 8: 3 (el Set elimina los duplicados)
}

// ===== EJERCICIO 4: COMBINACIÓN DE COLECCIONES =====
do {
    // ===== TODO 10: Inventario de productos =====
    var precios: [String: Double] = [:]
    var stocks: [String: Int] = [:]

    print("¿Cuántos productos?")
    let n = Int(readLine() ?? "") ?? 0
    if n > 0 {                        // evita el rango inválido 1...0 si no se ingresa nada
        for i in 1...n {
            print("Producto \(i) - Nombre:")
            let nombre = readLine() ?? ""
            print("Precio:")
            let precio = Double(readLine() ?? "") ?? 0
            print("Stock:")
            let stock = Int(readLine() ?? "") ?? 0
            precios[nombre] = precio
            stocks[nombre] = stock
        }
    }

    // TODO: Calcular valor total (precio × stock)
    var valorInventario = 0.0
    for (nombre, precio) in precios {
        let stock = stocks[nombre] ?? 0
        valorInventario += precio * Double(stock)
    }
    print("Valor total del inventario: S/. \(valorInventario)")

    // TODO: Mostrar productos con stock < 5
    print("Productos con stock bajo (< 5):")
    var hayStockBajo = false
    for (nombre, stock) in stocks {
        if stock < 5 {
            print("- \(nombre): \(stock) unidades")
            hayStockBajo = true
        }
    }
    if !hayStockBajo {
        print("Ninguno")
    }
}

// ===== EJERCICIO 5: CARRITO DE COMPRAS 2.0 =====
do {
    var nombres: [String] = []
    var precios: [Double] = []
    var cantidades: [Int] = []

    // TODO 11: Pedir productos
    print("¿Cuántos productos va a comprar?")
    let totalProductos = Int(readLine() ?? "") ?? 0
    if totalProductos > 0 {
        for i in 1...totalProductos {
            print("\nProducto \(i) - Nombre:")
            nombres.append(readLine() ?? "")
            print("Precio unitario:")
            precios.append(Double(readLine() ?? "") ?? 0)
            print("Cantidad:")
            cantidades.append(Int(readLine() ?? "") ?? 0)
        }
    }

    // TODO 12: Calcular subtotales
    var subtotales: [Double] = []
    for i in 0..<nombres.count {
        let sub = precios[i] * Double(cantidades[i])
        subtotales.append(sub)
    }

    // TODO 13: Total del carrito
    var totalCarrito = 0.0
    for sub in subtotales {
        totalCarrito += sub
    }

    // TODO 14: Nombre del cliente
    print("\nNombre del cliente:")
    let cliente = readLine() ?? ""

    // TODO 15: Descuento
    var descPct = 0.0
    if totalCarrito >= 5000 { descPct = 0.15 }
    else if totalCarrito >= 2000 { descPct = 0.10 }
    else if totalCarrito >= 500 { descPct = 0.05 }
    let descuento = totalCarrito * descPct
    let totalConDesc = totalCarrito - descuento

    // TODO 16: IGV y total
    let igv = totalConDesc * 0.18
    let totalFinal = totalConDesc + igv

    // TODO 17: Categoría
    var categoria = ""
    switch Int(totalCarrito) {
    case 0..<500: categoria = "Regular"
    case 500..<2000: categoria = "Frecuente"
    case 2000..<5000: categoria = "VIP"
    default: categoria = "Premium"
    }

    // TODO 18: Ticket
    let sep = String(repeating: "=", count: 45)
    print(sep)
    print("        TICKET DE COMPRA 2.0")
    print("  Cliente: \(cliente) (\(categoria))")
    print(sep)
    for i in 0..<nombres.count {
        print("\(nombres[i]) x\(cantidades[i])   S/. \(subtotales[i])")
    }
    print(sep)
    print("Subtotal:           S/. \(totalCarrito)")
    if descPct > 0 {
        print("Descuento (\(descPct*100)%): -S/. \(String(format: "%.2f", descuento))")
    }
    print("IGV (18%):          S/. \(String(format: "%.2f", igv))")
    print(sep)
    print("TOTAL:              S/. \(String(format: "%.2f", totalFinal))")
    print(sep)
    print("¡Gracias por su compra, \(cliente)!")
}
