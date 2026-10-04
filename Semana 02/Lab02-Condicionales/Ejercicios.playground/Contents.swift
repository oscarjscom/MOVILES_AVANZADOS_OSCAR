// Desarrollado por: Oscar Olano
// Laboratorio 02 — Estructuras Condicionales y Bucles
// Docente : Juan León S.

import Foundation   // Cambio visto en clase: en Playground basta Foundation (no UIKit)

// Cada ejercicio va dentro de un bloque do { } para que sus variables
// no choquen con las de otros ejercicios (por ejemplo "nota" o "numero").

// ===== EJERCICIO 1: CONDICIONALES =====
do {
    // --- Ejemplo (ya resuelto): ---
    let nota = 15.0
    if nota >= 13.0 {
        print("Aprobado con \(nota)")
    } else {
        print("Desaprobado con \(nota)")
    }

    // --- TODO 1: Validar si una persona es mayor de edad ---
    let edad = 17
    if edad >= 18 {
        print("Es mayor de edad")
    } else {
        print("Es menor de edad")
    }

    // --- TODO 2: Clasificar una nota con else if ---
    let miNota = 16.0
    if miNota >= 18 {
        print("Excelente")
    } else if miNota >= 15 {
        print("Bueno")
    } else if miNota >= 13 {
        print("Aprobado")
    } else {
        print("Desaprobado")
    }

    // --- TODO 3: Verificar si un número es positivo, negativo o cero ---
    let numero = -5
    if numero > 0 {
        print("\(numero) es positivo")
    } else if numero < 0 {
        print("\(numero) es negativo")
    } else {
        print("Es cero")
    }

    // ===== FIX: Encuentra y corrige los 3 errores =====
    let temperatura = 35
    if temperatura > 30 {
        print("Hace calor")
    } else if temperatura > 20 {          // FIX 1: faltaba la llave { después de la condición
        print("Clima agradable")
    } else {
        print("Hace frío")
    }

    let saldo = 100.0
    let compra = 150.0
    if saldo >= compra {                  // FIX 2: con > no se podía comprar si el saldo era EXACTO
        print("Compra realizada")
    } else {
        print("Saldo insuficiente: te faltan \(compra - saldo)")  // FIX 3: era saldo - compra (daba -50.0)
    }

    let hora = 25
    if hora >= 0 && hora < 12 {
        print("Buenos días")
    } else if hora >= 12 && hora < 18 {
        print("Buenas tardes")
    } else if hora >= 18 && hora <= 23 {
        print("Buenas noches")
    } else {
        print("Hora inválida")            // Correcto: 25 no es una hora válida
    }

    // ===== PREDICT =====
    let x = 10
    if x > 5 && x < 20 {
        print("Dentro del rango")
    } else {
        print("Fuera del rango")
    }                 // PREDICT 1: "Dentro del rango" (10 cumple ambas condiciones)

    let y = 15
    if y > 20 {
        print("Mayor que 20")
    } else if y > 10 {
        print("Mayor que 10")
    } else if y > 5 {
        print("Mayor que 5")
    }                 // PREDICT 2: "Mayor que 10"
    // No imprime "Mayor que 5" porque en una cadena if / else if solo se ejecuta
    // el PRIMER bloque cuya condición es verdadera; los demás se saltan.

    let esLunes = true
    let llueve = false
    if esLunes && llueve {
        print("Lunes lluvioso")
    } else if esLunes || llueve {
        print("Es lunes O llueve")
    } else {
        print("Ni lunes ni llueve")
    }                 // PREDICT 3: "Es lunes O llueve" (&& es falso, || es verdadero)
}

// ===== EJERCICIO 2: SWITCH =====
do {
    // --- Ejemplo (ya resuelto): ---
    let diaSemana = 3
    switch diaSemana {
    case 1: print("Lunes")
    case 2: print("Martes")
    case 3: print("Miércoles")
    case 4: print("Jueves")
    case 5: print("Viernes")
    case 6: print("Sábado")
    case 7: print("Domingo")
    default: print("Día inválido")
    }

    // --- TODO 4: Clasificar nota numérica a letra ---
    let nota = 16
    switch nota {
    case 18...20: print("A - Excelente")
    case 15...17: print("B - Bueno")
    case 13...14: print("C - Aprobado")
    case 11...12: print("D - Desaprobado")
    case 0...10:  print("E - Muy bajo")
    default: print("Nota inválida")
    }

    // --- TODO 5: Calculadora simple con switch ---
    let num1 = 20.0
    let num2 = 5.0
    let operacion = "+"
    switch operacion {
    case "+": print("Resultado: \(num1 + num2)")
    case "-": print("Resultado: \(num1 - num2)")
    case "*": print("Resultado: \(num1 * num2)")
    case "/":
        if num2 != 0 {                    // validación: no se puede dividir entre 0
            print("Resultado: \(num1 / num2)")
        } else {
            print("Error: no se puede dividir entre 0")
        }
    default: print("Operación no válida")
    }

    // --- TODO 6: Categoría de producto por precio ---
    let precio = 350.0
    switch precio {
    case 0..<100:    print("Económico")
    case 100..<500:  print("Medio")
    case 500..<1000: print("Premium")
    case 1000...:    print("Lujo")
    default:         print("Precio inválido")   // precios negativos
    }

    // ===== PREDICT =====
    let mes = 2
    switch mes {
    case 1, 3, 5, 7, 8, 10, 12: print("31 días")
    case 4, 6, 9, 11: print("30 días")
    case 2: print("28 o 29 días")
    default: print("Mes inválido")
    }                 // PREDICT 4: "28 o 29 días"

    let letra: Character = "a"
    switch letra {
    case "a", "e", "i", "o", "u": print("Vocal")
    default: print("Consonante")
    }                 // PREDICT 5: "Vocal"
}

// ===== EJERCICIO 3: FOR-IN =====
do {
    // --- Ejemplo (ya resuelto): ---
    for i in 1...5 {
        print("Número: \(i)")
    }

    // --- TODO 7: Tabla de multiplicar del 7 ---
    for i in 1...12 {
        print("7 x \(i) = \(7 * i)")
    }

    // --- TODO 8: Sumatoria del 1 al 100 ---
    var suma = 0
    for i in 1...100 {
        suma = suma + i
    }
    print("La suma del 1 al 100 es: \(suma)")   // 5050

    // --- TODO 9: Calcular el factorial de 8 ---
    var factorial = 1
    for i in 1...8 {
        factorial = factorial * i
    }
    print("8! = \(factorial)")                  // 40320

    // --- TODO 10: Patrón de asteriscos ---
    for i in 1...5 {
        print(String(repeating: "*", count: i))
    }

    // ===== FIX: Encuentra los 2 errores =====
    // Se quiere imprimir los números pares del 2 al 20:
    for i in 1...20 {
        if i % 2 == 0 {               // FIX 4: con == 1 imprimía los IMPARES
            print(i)
        }
    }

    // Se quiere contar del 10 al 1 (cuenta regresiva):
    for i in stride(from: 10, through: 1, by: -1) {   // FIX 5: 1...10 cuenta hacia ADELANTE
        print(i)
    }

    // ===== PREDICT =====
    var total = 0
    for i in 1...5 {
        total += i
    }
    print(total)      // PREDICT 6: valor 15, 5 iteraciones

    var texto = ""
    for _ in 1...3 {
        texto += "Hola "
    }
    print(texto)      // PREDICT 7: "Hola Hola Hola "
    // El _ se usa cuando NO necesitamos el número de la vuelta: solo repetir 3 veces.
}
