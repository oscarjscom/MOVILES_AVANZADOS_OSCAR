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
