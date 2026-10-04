// Desarrollado por: Oscar Olano
// Laboratorio 03 — Ejercicio 6: Gestión de Notas (asistido por IA)
// Docente: Juan Leon — Tecsup
// Ejecutar en Terminal con: swift Contents.swift  (readLine() no funciona en Playground)

import Foundation                                          // da acceso a readLine() y String(format:) para redondear

var registro: [String: [Double]] = [:]                     // diccionario: clave = nombre del alumno, valor = array con sus 3 notas

print("¿Cuántos alumnos?")                                  // pide la cantidad de alumnos a registrar
let cantidad = Int(readLine() ?? "") ?? 0                  // lee el texto, lo convierte a Int y usa 0 si no es un número válido

if cantidad > 0 {                                          // evita el rango inválido 1...0 cuando no se ingresa nada
    for i in 1...cantidad {                                // una vuelta por cada alumno
        print("\nAlumno \(i) - Nombre:")                   // pide el nombre del alumno número i
        let nombre = readLine() ?? ""                      // guarda el nombre; si falla la lectura queda vacío
        var notas: [Double] = []                           // array temporal para las 3 notas de este alumno
        for j in 1...3 {                                   // repite 3 veces porque cada alumno tiene 3 notas
            print("Nota \(j):")                            // indica qué nota se está pidiendo
            let nota = Double(readLine() ?? "") ?? 0       // convierte el texto a Double; si no es número cuenta como 0
            notas.append(nota)                             // agrega la nota al final del array del alumno
        }
        registro[nombre] = notas                           // guarda las 3 notas en el diccionario usando el nombre como clave
    }
}

var nombresOrden: [String] = []                            // array paralelo con los nombres, para poder ordenarlos después
var promediosOrden: [Double] = []                          // array paralelo con el promedio de cada nombre (misma posición)
var notaMasAlta = 0.0                                      // empieza en 0 (la mínima posible) para que cualquier nota la supere
var notaMasBaja = 20.0                                     // empieza en 20 (la máxima posible) para que cualquier nota sea menor
var sumaPromedios = 0.0                                    // acumula los promedios para sacar el promedio general
var aprobados = 0                                          // contador de alumnos con promedio >= 13

print("\n===== REPORTE POR ALUMNO =====")                  // título de la primera sección del reporte
for (nombre, notas) in registro {                          // recorre cada par (alumno, notas) del diccionario
    var suma = 0.0                                         // suma de las 3 notas de ESTE alumno
    for nota in notas {                                    // recorre las notas del alumno
        suma += nota                                       // va acumulando cada nota
        if nota > notaMasAlta { notaMasAlta = nota }       // si la nota supera la máxima vista, pasa a ser la nueva máxima
        if nota < notaMasBaja { notaMasBaja = nota }       // si la nota es menor que la mínima vista, pasa a ser la nueva mínima
    }
    let promedio = suma / Double(notas.count)              // promedio del alumno = suma / cantidad de notas (3)

    var clasificacion = ""                                 // texto con la categoría que se decide en el switch
    switch promedio {                                      // switch con rangos de Double para clasificar el promedio
    case 18...20:     clasificacion = "Excelente"          // de 18 a 20 inclusive
    case 15..<18:     clasificacion = "Bueno"              // de 15 hasta antes de 18
    case 13..<15:     clasificacion = "Aprobado"           // de 13 hasta antes de 15 (13 es la nota mínima aprobatoria)
    default:          clasificacion = "Desaprobado"        // todo lo que sea menor a 13
    }

    print("\(nombre): \(notas) → Promedio \(String(format: "%.2f", promedio)) (\(clasificacion))") // muestra notas, promedio con 2 decimales y categoría

    sumaPromedios += promedio                              // suma el promedio del alumno al acumulador general
    if promedio >= 13 { aprobados += 1 }                   // cuenta al alumno como aprobado si llega a 13
    nombresOrden.append(nombre)                            // guarda el nombre para la lista ordenada
    promediosOrden.append(promedio)                        // guarda el promedio en la misma posición que su nombre
}

// Ordenamiento por promedio (de mayor a menor) con el método burbuja,
// usando solo bucles e índices (sin closures, que se ven más adelante).
let total = promediosOrden.count                           // cantidad de alumnos a ordenar
if total > 1 {                                             // solo hace falta ordenar si hay 2 o más alumnos
    for i in 0..<(total - 1) {                             // cada pasada deja el menor promedio al final
        for j in 0..<(total - 1 - i) {                     // compara pares vecinos que aún no están en su lugar final
            if promediosOrden[j] < promediosOrden[j + 1] { // si el de la izquierda es menor, están en el orden equivocado
                let tempProm = promediosOrden[j]           // guarda temporalmente el promedio de la izquierda
                promediosOrden[j] = promediosOrden[j + 1]  // mueve el promedio mayor a la izquierda
                promediosOrden[j + 1] = tempProm           // pone el menor a la derecha
                let tempNom = nombresOrden[j]              // hace el MISMO intercambio con los nombres
                nombresOrden[j] = nombresOrden[j + 1]      // para que cada nombre siga junto a su promedio
                nombresOrden[j + 1] = tempNom              // completa el intercambio del nombre
            }
        }
    }
}

print("\n===== RANKING (mayor a menor) =====")             // título del ranking
for i in 0..<nombresOrden.count {                          // recorre los arrays ya ordenados por posición
    print("\(i + 1). \(nombresOrden[i]) - \(String(format: "%.2f", promediosOrden[i]))") // puesto (i + 1 porque i empieza en 0), nombre y promedio
}

print("\n===== ESTADÍSTICAS =====")                        // título de las estadísticas generales
if total > 0 {                                             // evita dividir entre 0 si no se registró a nadie
    let promedioGeneral = sumaPromedios / Double(total)    // promedio de todos los promedios
    let porcentaje = Double(aprobados) / Double(total) * 100 // proporción de aprobados convertida a porcentaje
    print("Promedio general: \(String(format: "%.2f", promedioGeneral))") // muestra el promedio general con 2 decimales
    print("Nota más alta: \(notaMasAlta)")                 // la mayor nota individual encontrada
    print("Nota más baja: \(notaMasBaja)")                 // la menor nota individual encontrada
    print("Aprobados: \(aprobados) de \(total) (\(String(format: "%.1f", porcentaje))%)") // cantidad y porcentaje de aprobados
} else {                                                   // caso sin alumnos registrados
    print("No se registraron alumnos")                     // mensaje en lugar de estadísticas vacías
}
