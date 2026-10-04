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
