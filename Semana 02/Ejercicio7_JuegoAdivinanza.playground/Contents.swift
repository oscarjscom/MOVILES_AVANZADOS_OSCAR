import Foundation

// ===== EJERCICIO 7: JUEGO DE ADIVINANZA (asistido por IA) =====

// Numero secreto que el jugador debe adivinar (fijo para esta simulacion).
let numeroSecreto = 42

// Simulamos 5 intentos del jugador usando variables individuales (sin arrays, tema de la Semana 3).
let intento1 = 20
let intento2 = 75
let intento3 = 42
let intento4 = 10
let intento5 = 60

// Variable que guarda el intento que se esta evaluando en la vuelta actual del while.
var intentoActual = intento1

// Contador de intentos realizados hasta el momento (empieza en 1 porque intento1 ya esta cargado).
var numeroIntento = 1

// Bandera que indica si el jugador ya adivino el numero secreto.
var adivino = false

// El bucle se repite mientras no haya adivinado y todavia queden intentos disponibles (maximo 5).
while !adivino && numeroIntento <= 5 {
    // Comparamos el intento actual contra el numero secreto.
    if intentoActual == numeroSecreto {
        // Coincide: el jugador gano, se marca adivino en true para terminar el bucle.
        print("Intento \(numeroIntento): \(intentoActual) -> ¡Correcto!")
        adivino = true
    } else if intentoActual > numeroSecreto {
        // El intento es mayor al secreto: hay que bajar el numero.
        print("Intento \(numeroIntento): \(intentoActual) -> Muy alto")
    } else {
        // El intento es menor al secreto: hay que subir el numero.
        print("Intento \(numeroIntento): \(intentoActual) -> Muy bajo")
    }

    // Si todavia no adivino, preparamos el siguiente intento segun el numero de vuelta actual.
    if !adivino {
        if numeroIntento == 1 { intentoActual = intento2 } // Despues del intento 1, probamos el intento 2.
        if numeroIntento == 2 { intentoActual = intento3 } // Despues del intento 2, probamos el intento 3.
        if numeroIntento == 3 { intentoActual = intento4 } // Despues del intento 3, probamos el intento 4.
        if numeroIntento == 4 { intentoActual = intento5 } // Despues del intento 4, probamos el intento 5.
        numeroIntento += 1 // Avanzamos el contador para la siguiente vuelta del while.
    }
}

// Al salir del bucle, revisamos si gano o si se quedo sin intentos.
if adivino {
    // Mensaje final de victoria con el numero de intentos que necesito.
    print("¡Ganaste en \(numeroIntento) intento(s)!")
} else {
    // Mensaje final de derrota mostrando cual era el numero secreto.
    print("Perdiste. El numero era: \(numeroSecreto)")
}
