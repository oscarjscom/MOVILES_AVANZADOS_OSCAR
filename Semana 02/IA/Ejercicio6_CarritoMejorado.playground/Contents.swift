import Foundation

// ===== EJERCICIO 6: CARRITO MEJORADO (asistido por IA) =====

// Estructura que representa un producto del carrito: nombre, precio unitario y cantidad comprada.
struct ProductoCarrito {
    let nombre: String
    let precio: Double
    let cantidad: Int
}

// Lista de productos del carrito para esta simulacion.
let productos = [
    ProductoCarrito(nombre: "Laptop", precio: 3500.0, cantidad: 1),
    ProductoCarrito(nombre: "Mouse", precio: 45.50, cantidad: 3),
    ProductoCarrito(nombre: "Teclado", precio: 120.00, cantidad: 1),
    ProductoCarrito(nombre: "Monitor", precio: 890.00, cantidad: 1),
    ProductoCarrito(nombre: "USB Cable", precio: 15.00, cantidad: 4)
]

// Cupon ingresado por el cliente para esta compra.
let cuponIngresado = "DESCUENTO20"

// Acumula el subtotal general de la compra (suma de los subtotales de cada producto).
var subtotalGeneral = 0.0

// Bandera que indica si se encontro algun dato invalido (precio negativo o cantidad en 0).
var datosInvalidos = false

// Recorremos cada producto para validarlo y calcular su subtotal con el descuento por cantidad.
for producto in productos {
    // Validacion: un precio negativo no tiene sentido en un carrito real.
    if producto.precio < 0 {
        print("Error: el precio de \(producto.nombre) es negativo")
        datosInvalidos = true
        continue // Saltamos este producto y seguimos revisando los demas.
    }
    // Validacion: una cantidad de 0 significa que el producto no deberia estar en el carrito.
    if producto.cantidad == 0 {
        print("Error: la cantidad de \(producto.nombre) es 0")
        datosInvalidos = true
        continue // Saltamos este producto y seguimos revisando los demas.
    }

    // Subtotal base: precio unitario multiplicado por la cantidad comprada.
    var subtotalProducto = producto.precio * Double(producto.cantidad)

    // Descuento por cantidad: si compra 3 o mas unidades del mismo producto, se aplica 5% extra en ESE producto.
    if producto.cantidad >= 3 {
        let descuentoPorCantidad = subtotalProducto * 0.05 // 5% del subtotal de este producto.
        subtotalProducto -= descuentoPorCantidad // Restamos el descuento al subtotal de este producto.
        print("\(producto.nombre): descuento por cantidad de 5% aplicado (-S/. \(String(format: "%.2f", descuentoPorCantidad)))")
    }

    // Sumamos el subtotal (ya con su posible descuento) al total general del carrito.
    subtotalGeneral += subtotalProducto
}

// Si hubo datos invalidos, detenemos el proceso de compra antes de seguir calculando.
if datosInvalidos {
    print("No se puede procesar la compra: revisa los datos marcados como error.")
} else {
    // Porcentaje de descuento adicional que da el cupon (0 si no aplica).
    var descuentoCupon = 0.0

    // Cupon de descuento: si el codigo es exactamente "DESCUENTO20", se aplica 20% adicional sobre el total.
    if cuponIngresado == "DESCUENTO20" {
        descuentoCupon = subtotalGeneral * 0.20 // 20% del subtotal general.
        print("Cupon DESCUENTO20 aplicado: -S/. \(String(format: "%.2f", descuentoCupon))")
    }

    // Total despues de aplicar el descuento del cupon.
    let totalConCupon = subtotalGeneral - descuentoCupon

    // Envio gratis: si el total (ya con cupon) supera S/. 3000, el envio no tiene costo; si no, cuesta S/. 25.00.
    let costoEnvio = totalConCupon > 3000 ? 0.0 : 25.0

    // Total final que el cliente debe pagar, incluyendo el envio.
    let totalFinal = totalConCupon + costoEnvio

    // Puntos de fidelidad: se gana 1 punto por cada S/. 100 de compra (division entera para redondear hacia abajo).
    let puntosGanados = Int(totalFinal / 100)

    // Construimos una linea separadora para el ticket, reutilizando el patron de bucle del Ejercicio 3.
    var separador = ""
    for _ in 1...40 {
        separador += "=" // Agregamos un caracter "=" en cada vuelta del bucle.
    }

    // Impresion del resumen final de la compra mejorada.
    print(separador)
    print("TICKET - CARRITO MEJORADO")
    print(separador)
    print("Subtotal con descuentos por cantidad: S/. \(String(format: "%.2f", subtotalGeneral))")
    print("Descuento cupon: S/. \(String(format: "%.2f", descuentoCupon))")
    print("Costo de envio: S/. \(String(format: "%.2f", costoEnvio))")
    print("TOTAL A PAGAR: S/. \(String(format: "%.2f", totalFinal))")
    print("Puntos de fidelidad ganados: \(puntosGanados)")
    print(separador)
}
