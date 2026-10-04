# Prompts utilizados — Laboratorio 06

## Herramienta de IA utilizada
Claude (Claude Code)

## Ejercicio 4 — Calculadora de Venta a Plazos de Electrodoméstico

### Prompt 1:
CONTEXTO: Soy estudiante de Programación en Móviles Avanzado, semana 6. Trabajo en Xcode 14.2 con UIKit y Storyboard. Ya hice el Ejercicio 2, donde pasé un `ClienteModel: NSObject` de una pantalla a otra.
TAREA: Crea una app con dos pantallas dentro de un UINavigationController. Pantalla "Nueva Venta": 5 UITextField (electrodoméstico, precio unitario, cantidad, meses, tasa de interés mensual) y un botón "Calcular" con segue Show de identifier `showResultado`. Pantalla "Resultado": 6 UILabel (subtotal, IGV, base, intereses, total, cuota mensual). Define `class VentaModel: NSObject` con esas 6 salidas como Double, calcula con las fórmulas `subtotal = precioUnitario x cantidad`, `igv = subtotal x 0.18`, `base = subtotal + igv`, `intereses = base x (tasaInteresMensual / 100) x meses`, `total = base + intereses`, `cuota = total / meses`, y pasa el VentaModel a "Resultado" con `prepare(for:sender:)`.
RESTRICCIONES: Solo lo visto hasta semana 6: clases, UINavigationController, prepare(for:sender:), IBOutlet/IBAction. Nada de Combine, Codable ni persistencia. Explica por qué usas `class` y no `struct` para VentaModel.
FORMATO: Archivos Swift separados (VentaModel.swift, ViewController.swift, ResultadoViewController.swift) y el Main.storyboard. Los valores en "Resultado" con `String(format: "S/. %.2f", valor)`.
EJEMPLO: precio 1750, cantidad 2, 12 meses, 1% mensual → Subtotal S/. 3500.00, IGV S/. 630.00, Base S/. 4130.00, Intereses S/. 495.60, Total S/. 4625.60, Cuota S/. 385.47.

### Respuesta de la IA:
Generó `VentaModel` (NSObject con las 6 propiedades Double y dos inicializadores), la pantalla "Nueva Venta" (`ViewController`) con el cálculo en `calcularVenta()`, `shouldPerformSegue(withIdentifier:sender:)` para no navegar si faltan datos, `prepare(for:sender:)` para pasar el modelo, y `ResultadoViewController` que muestra cada valor con `String(format: "S/. %.2f", valor)`. También armó el Storyboard con el Navigation Controller, las dos pantallas en UIStackView y el segue Show `showResultado`.

### ¿Funcionó a la primera?
Sí: compiló sin errores en Xcode 14.2 y con los datos del ejemplo da exactamente S/. 4625.60 de total y S/. 385.47 de cuota.

### ¿Usó algo que no hemos visto en clase?
Sí, algunas cosas:
- **`guard let`** para leer los números de los campos, en vez de usar `!` como en el Ejercicio 2.
- **`shouldPerformSegue(withIdentifier:sender:)`** para cancelar el segue si los datos no son válidos.
- **`UIAlertController`** para avisar "Datos incompletos".
- Aceptar coma o punto decimal con `replacingOccurrences(of:with:)`.

### ¿Por qué `class` y no `struct` para VentaModel? (según la IA)
Porque sigue el mismo patrón de `ClienteModel: NSObject` del Ejercicio 2: una clase es un tipo por **referencia**, así que la pantalla "Resultado" recibe el mismo objeto que se creó en "Nueva Venta". Con `struct` (tipo por **valor**) se pasaría una copia; para un paso de datos *hacia adelante* también funcionaría, pero si la pantalla destino modificara el modelo, la pantalla de origen no vería esos cambios.

## Reflexión: ¿qué hizo distinto la IA?
- **Validó los campos vacíos sin que se lo pidiera.** En el Ejercicio 2 se usa `self.tfApellido.text!`; aquí la IA evitó que la app se caiga o calcule con datos vacíos.
- **Usó `guard let` en vez del patrón visto en clase** para convertir los textos a `Double`.
- **Usó un segue con identifier y `prepare(for:sender:)`** en lugar de `instantiateViewController(identifier:)` + `present(...)` del Ejercicio 2, tal como pedía el enunciado.
- **Organizó la vista con UIStackView**, lo que reduce la cantidad de constraints manuales.

[Completa con tu opinión: ¿qué línea no entendiste del todo? ¿qué te pareció mejor de tu versión del Ejercicio 2 y qué de la versión de la IA?]
