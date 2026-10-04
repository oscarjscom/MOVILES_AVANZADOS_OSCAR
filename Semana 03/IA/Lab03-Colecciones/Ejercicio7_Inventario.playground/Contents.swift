// Desarrollado por: Oscar Olano
// Laboratorio 03 — Ejercicio 7: Inventario con menú (asistido por IA)
// Docente: Juan Leon — Tecsup
// Ejecutar en Terminal con: swift Contents.swift  (readLine() no funciona en Playground)

import Foundation                                          // da acceso a readLine() y String(format:)

var precios: [String: Double] = [:]                        // diccionario nombre → precio unitario
var stocks: [String: Int] = [:]                            // diccionario nombre → unidades disponibles (misma clave que precios)
let stockMinimo = 5                                        // umbral: menos de 5 unidades se considera stock bajo

print("¿Cuántos productos va a registrar?")                 // pide la cantidad inicial de productos
let n = Int(readLine() ?? "") ?? 0                         // convierte la respuesta a Int; 0 si no es un número

if n > 0 {                                                 // evita el rango inválido 1...0
    for i in 1...n {                                       // una vuelta por producto
        print("\nProducto \(i) - Nombre:")                 // pide el nombre del producto i
        let nombre = readLine() ?? ""                      // lee el nombre (vacío si falla)
        print("Precio:")                                   // pide el precio
        let precio = Double(readLine() ?? "") ?? 0         // convierte a Double; 0 si el texto no es número
        print("Stock:")                                    // pide el stock
        let stock = Int(readLine() ?? "") ?? 0             // convierte a Int; 0 si el texto no es número
        precios[nombre] = precio                           // guarda el precio bajo el nombre del producto
        stocks[nombre] = stock                             // guarda el stock bajo el MISMO nombre para relacionarlos
    }
}

var opcion = 0                                             // opción elegida en el menú; 0 = todavía no eligió
while opcion != 5 {                                        // el menú se repite hasta que el usuario elija 5 (Salir)
    print("\n========== MENÚ ==========")                  // encabezado del menú
    print("1) Ver inventario")                             // opción 1
    print("2) Buscar producto")                            // opción 2
    print("3) Stock bajo")                                 // opción 3
    print("4) Valor total")                                // opción 4
    print("5) Salir")                                      // opción 5: termina el while
    print("Elija una opción:")                             // pide la opción
    opcion = Int(readLine() ?? "5") ?? 0                   // si se acaba la entrada usa "5" para no quedar en bucle infinito; texto inválido = 0

    switch opcion {                                        // decide qué hacer según la opción
    case 1:                                                // VER INVENTARIO
        print("\n--- INVENTARIO ---")                      // título del reporte
        for (nombre, precio) in precios {                  // recorre todos los productos
            let stock = stocks[nombre] ?? 0                // busca el stock del mismo producto; 0 si no existiera
            print("\(nombre) | S/. \(String(format: "%.2f", precio)) | Stock: \(stock)") // fila con nombre, precio con 2 decimales y stock
        }
    case 2:                                                // BUSCAR PRODUCTO
        print("Nombre a buscar:")                          // pide el nombre
        let buscar = readLine() ?? ""                      // lee el nombre a buscar
        if let precio = precios[buscar] {                  // if let: solo entra si la clave existe en el diccionario
            print("\(buscar): S/. \(String(format: "%.2f", precio)), stock \(stocks[buscar] ?? 0)") // muestra precio y stock del encontrado
        } else {                                           // la clave no existe
            print("\(buscar) no está en el inventario")    // mensaje de no encontrado
        }
    case 3:                                                // STOCK BAJO
        print("\n--- STOCK BAJO (< \(stockMinimo)) ---")   // título usando el umbral definido arriba
        var encontrados = 0                                // cuenta cuántos productos tienen stock bajo
        for (nombre, stock) in stocks {                    // recorre el diccionario de stocks
            if stock < stockMinimo {                       // compara con el umbral
                print("⚠️ \(nombre): \(stock) unidades")   // lista el producto con poco stock
                encontrados += 1                           // suma uno al contador
            }
        }
        if encontrados == 0 {                              // si ningún producto cumplió la condición
            print("Todos los productos tienen stock suficiente") // mensaje para no dejar el reporte vacío
        }
    case 4:                                                // VALOR TOTAL
        var valorTotal = 0.0                               // acumulador del valor del inventario
        for (nombre, precio) in precios {                  // recorre los productos
            let stock = stocks[nombre] ?? 0                // stock del producto
            valorTotal += precio * Double(stock)           // valor del producto = precio × stock (Int convertido a Double)
        }
        print("Valor total del inventario: S/. \(String(format: "%.2f", valorTotal))") // muestra el total con 2 decimales
    case 5:                                                // SALIR
        print("¡Hasta luego!")                             // despedida; la condición del while terminará el bucle
    default:                                               // cualquier otro número o texto inválido
        print("Opción no válida, intente de nuevo")        // avisa y el while vuelve a mostrar el menú
    }
}
