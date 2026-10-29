# Semana 09: Boleta de pago, del sueldo al neto

Una app de una sola pantalla en SwiftUI y una hoja de Excel que explica cada fórmula. La app y el Excel dan el mismo resultado, al centavo, en los 4 casos de prueba y en los 2 casos propios.

| Parte | Expone | Archivo |
|---|---|---|
| Excel con todas las fórmulas | Participante 1 | `Excel/Boleta_de_pago.xlsx` |
| App SwiftUI | Participante 2 | `BoletaPago/BoletaPago.xcodeproj` |
| Respuestas y tabla de fuentes | Ambos | `Analisis.md` |

## App (SwiftUI, sin Storyboard)

Una pantalla: el formulario arriba y, al pulsar **Calcular**, la boleta debajo con sus tres bloques (Remuneraciones, Retenciones / Descuentos y Aportaciones del empleador) y el neto a pagar. Solo usa Text, VStack, HStack, @State, TextField, Picker, Button y ScrollView.

| Archivo | Contenido |
|---|---|
| `Modelos.swift` | Structs `DatosTrabajador`, `TasasAFP` y `Concepto`. Parámetros en un solo lugar (`Parametros`), con el diccionario de tasas de cada AFP |
| `Boleta.swift` | Clase `Boleta`, que calcula. Arma los arrays de conceptos de remuneraciones y descuentos, y de ellos salen los totales y el neto |
| `ContentView.swift` | La pantalla: formulario, validaciones con mensajes claros y la boleta |
| `BoletaPagoTests.swift` | Pruebas de los casos 1, 2 y 3 con las respuestas del documento |

Niveles: el 1 y el 2 están completos (ONP o AFP, horas extras y adelantos). El 3, que es el reto, no se hizo.

## Excel

| Hoja | Contenido |
|---|---|
| Parámetros | RMV, porcentajes, tasas de cada AFP, fuente y fecha de consulta. Las fórmulas los usan por su nombre |
| Boleta | Datos de entrada y cálculo con fórmulas visibles. La columna C muestra la fórmula de cada celda |
| Casos | Los 4 casos y los 2 casos propios, con el control cruzado frente al documento |
| Explicación | Cada fórmula en palabras, la fórmula de Excel, un ejemplo numérico y su resultado |

## Cómo ejecutarla

1. Abrir `BoletaPago/BoletaPago.xcodeproj` en Xcode.
2. Elegir un simulador de iPhone y presionar **Cmd + R**.
3. Para correr las pruebas de los casos: **Cmd + U**.

## Capturas

Pendientes.
