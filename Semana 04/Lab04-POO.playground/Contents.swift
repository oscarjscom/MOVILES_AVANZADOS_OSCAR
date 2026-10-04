// Desarrollado por: Oscar Olano
// Laboratorio 04 — Programación Orientada a Objetos en Swift
// Docente: Juan León

import Foundation

// ===== CASO 1.5: HERENCIA Y POLIMORFISMO — LA CADENA DE SUCURSALES =====

enum CategoriaElectro {
    case lineaBlanca, tecnologia, pequenos
}

struct Electrodomestico {
    let nombre: String
    let marca: String
    let precioLista: Double
    let categoria: CategoriaElectro
}

// --- Ejemplo (ya resuelto): la base define el FLUJO; las hijas cambian las REGLAS ---
class Sucursal {
    let nombre: String
    let ciudad: String

    init(nombre: String, ciudad: String) {
        self.nombre = nombre
        self.ciudad = ciudad
    }

    func descuento() -> Double {
        return 0.05
    }

    func costoEnvio(monto: Double) -> Double {
        return 30.0
    }

    // REGLA 2: este metodo NO se sobreescribe en las subclases
    func cotizar(item: Electrodomestico) {
        let precioConDescuento = item.precioLista * (1 - descuento())
        let envio = costoEnvio(monto: precioConDescuento)
        let total = precioConDescuento + envio
        print("\(nombre): \(item.nombre) -> S/ \(precioConDescuento) + envio S/ \(envio) = S/ \(total)")
    }
}

// --- TODO 14: SucursalLima ---
class SucursalLima: Sucursal {
    override func descuento() -> Double {
        return 0.10
    }

    override func costoEnvio(monto: Double) -> Double {
        if monto >= 1500 {
            return 0.0          // envío gratis desde S/ 1500
        } else {
            return 30.0
        }
    }
}

// --- TODO 15: SucursalProvincia ---
// No sobreescribe descuento(): hereda el 5 % de la base
class SucursalProvincia: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        let envio = monto * 0.08
        if envio < 50.0 {
            return 50.0         // mínimo de S/ 50
        } else {
            return envio
        }
    }
}

// --- TODO 16: SucursalOutlet ---
class SucursalOutlet: Sucursal {
    override func descuento() -> Double {
        return 0.25
    }

    override func costoEnvio(monto: Double) -> Double {
        return 0.0              // solo recojo en tienda
    }
}

// --- TODO 18: La prueba del polimorfismo (REGLA 6) ---
class SucursalOnline: Sucursal {
    override func costoEnvio(monto: Double) -> Double {
        return 15.0
    }
}
// Respuesta: se necesitaron 5 líneas nuevas para la clase SucursalOnline + 1 elemento
// nuevo en el array. No se tocó cotizar(item:) ni los for-in: eso demuestra el polimorfismo.

// --- TODO 17: El recorrido polimorfico (REGLA 4) ---
let refrigeradora = Electrodomestico(nombre: "Refrigeradora", marca: "Frost", precioLista: 2000.0, categoria: .lineaBlanca)
let licuadora = Electrodomestico(nombre: "Licuadora", marca: "Mix", precioLista: 250.0, categoria: .pequenos)
let sucursales: [Sucursal] = [SucursalLima(nombre: "Lima Centro", ciudad: "Lima"),
                              SucursalProvincia(nombre: "Provincia Cusco", ciudad: "Cusco"),
                              SucursalOutlet(nombre: "Outlet Ate", ciudad: "Lima"),
                              SucursalOnline(nombre: "Tienda Online", ciudad: "Lima")]   // TODO 18
print("===== Refrigeradora (S/ 2000.0) =====")
for sucursal in sucursales { sucursal.cotizar(item: refrigeradora) }
print("===== Licuadora (S/ 250.0) =====")
for sucursal in sucursales { sucursal.cotizar(item: licuadora) }

// ===== FIX: Este codigo tenia 2 errores =====
class SucursalMall: Sucursal {
    override func descuento() -> Double {   // FIX 7: faltaba "override". Swift lo exige para dejar claro
        return 0.12                          // que se reemplaza un método heredado y no se crea uno nuevo por error.
    }
}

class SucursalExpress: Sucursal {
    let radioKm: Int

    init(nombre: String, ciudad: String, radioKm: Int) {
        self.radioKm = radioKm
        super.init(nombre: nombre, ciudad: ciudad)   // FIX 8: faltaba llamar a super.init para inicializar
    }                                                 // las propiedades heredadas (nombre y ciudad).
}

// ===== PREDICT: Que imprime? =====
let misteriosa: Sucursal = SucursalLima(nombre: "Lima Centro", ciudad: "Lima")
print(misteriosa.descuento())     // PREDICT 6: 0.1. Aunque la variable es de tipo Sucursal, el objeto real
                                  // es SucursalLima y Swift ejecuta su override en tiempo de ejecución.
let monto = 2000.0 * (1 - misteriosa.descuento())
print(misteriosa.costoEnvio(monto: monto))   // PREDICT 7: 0.0 (monto = 1800, Lima da envío gratis desde 1500)
