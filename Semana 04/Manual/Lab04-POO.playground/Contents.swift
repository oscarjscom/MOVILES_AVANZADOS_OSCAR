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

// ===== CASO 2 — PARTE A: BIBLIOTECA (SIN IA) =====

enum EstadoLibro {
    case disponible
    case prestado
}

struct Libro {
    var titulo: String
    var autor: String
    var estado: EstadoLibro = .disponible
}

class Biblioteca {
    var libros: [Libro] = []

    func agregar(libro: Libro) {
        libros.append(libro)
    }

    func prestar(titulo: String) -> Bool {
        for i in 0..<libros.count {
            if libros[i].titulo == titulo {
                if libros[i].estado == .disponible {
                    libros[i].estado = .prestado      // se edita el struct dentro del array, no una copia
                    print("Préstamo aprobado: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) ya está prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)")
        return false
    }

    func devolver(titulo: String) -> Bool {
        for i in 0..<libros.count {
            if libros[i].titulo == titulo {
                if libros[i].estado == .prestado {
                    libros[i].estado = .disponible
                    print("Devolución registrada: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) no estaba prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)")
        return false
    }

    func inventario() {
        print("===== INVENTARIO =====")
        for libro in libros {
            var textoEstado = ""
            switch libro.estado {
            case .disponible: textoEstado = "disponible"
            case .prestado:   textoEstado = "prestado"
            }
            print("\(libro.titulo) (\(libro.autor)) - \(textoEstado)")
        }
    }
}

let biblioteca = Biblioteca()
biblioteca.agregar(libro: Libro(titulo: "Cien años de soledad", autor: "Gabriel García Márquez"))
biblioteca.agregar(libro: Libro(titulo: "La ciudad y los perros", autor: "Mario Vargas Llosa"))
biblioteca.agregar(libro: Libro(titulo: "El Quijote", autor: "Miguel de Cervantes"))

_ = biblioteca.prestar(titulo: "La ciudad y los perros")
_ = biblioteca.prestar(titulo: "La ciudad y los perros")
_ = biblioteca.devolver(titulo: "La ciudad y los perros")
_ = biblioteca.prestar(titulo: "El Quijote")
_ = biblioteca.prestar(titulo: "El Principito")
biblioteca.inventario()

// ===== ACTIVIDAD PROPUESTA 01: FACTURA DE CURSOS LIBRES TECSUP =====

struct CursoLibre {
    let nombre: String
    let precio: Double
    let cantidad: Int
}

class Estudiante {
    let nombre: String
    let dni: String
    let esAlumnoTecsup: Bool
    var cursos: [CursoLibre] = []

    init(nombre: String, dni: String, esAlumnoTecsup: Bool) {
        self.nombre = nombre
        self.dni = dni
        self.esAlumnoTecsup = esAlumnoTecsup
    }

    func inscribir(curso: CursoLibre) {
        cursos.append(curso)
    }

    func imprimirFactura() {
        let linea = String(repeating: "-", count: 32)
        print("🎓 FACTURA DE CURSOS")
        print("Estudiante: \(nombre)")
        print("DNI: \(dni)")
        print("Alumno de Tecsup: \(esAlumnoTecsup ? "Sí ✅" : "No")")
        print(linea)

        var subtotal = 0.0
        for curso in cursos {
            let importe = curso.precio * Double(curso.cantidad)
            subtotal += importe
            print("\(curso.nombre) x\(curso.cantidad) - S/ \(String(format: "%.2f", importe))")
        }
        print(linea)

        let igv = subtotal * 0.18
        let totalConIgv = subtotal + igv
        print("Subtotal: S/ \(String(format: "%.2f", subtotal))")
        print("IGV (18%): S/ \(String(format: "%.2f", igv))")
        print("Total con IGV: S/ \(String(format: "%.2f", totalConIgv))")

        var totalFinal = totalConIgv
        if cursos.count >= 3 {                       // 3 o más cursos: 10 % del total con IGV
            let descCantidad = totalConIgv * 0.10
            totalFinal -= descCantidad
            print("Descuento 10% por cantidad: -S/ \(String(format: "%.2f", descCantidad)) ✅")
            if esAlumnoTecsup {                      // S/ 400 extra solo si además lleva 3 o más cursos
                totalFinal -= 400
                print("Descuento especial Tecsup: -S/ 400.00 ✅")
            }
        }
        print(linea)
        print("💰 TOTAL FINAL A PAGAR: S/ \(String(format: "%.2f", totalFinal))")
    }
}

let estudiante = Estudiante(nombre: "Juan León", dni: "78965412", esAlumnoTecsup: true)
estudiante.inscribir(curso: CursoLibre(nombre: "Swift Avanzado", precio: 450, cantidad: 1))
estudiante.inscribir(curso: CursoLibre(nombre: "IA con Python", precio: 650, cantidad: 2))
estudiante.inscribir(curso: CursoLibre(nombre: "Diseño UX/UI", precio: 500, cantidad: 1))
estudiante.imprimirFactura()

// ===== ACTIVIDAD PROPUESTA 02: CLIENTES (HERENCIA) =====

class Cliente {
    let codigo: String
    let direccion: String
    let fechaDeRegistro: String
    let numeroCuenta: String
    let montoMinimoApertura: Double

    init(codigo: String, direccion: String, fechaDeRegistro: String, numeroCuenta: String, montoMinimoApertura: Double) {
        self.codigo = codigo
        self.direccion = direccion
        self.fechaDeRegistro = fechaDeRegistro
        self.numeroCuenta = numeroCuenta
        self.montoMinimoApertura = montoMinimoApertura
    }

    func mostrarDatos() {
        print("📄 Código: \(codigo)")
        print("📍 Dirección: \(direccion)")
        print("📅 Fecha de registro: \(fechaDeRegistro)")
        print("🏦 Nº Cuenta: \(numeroCuenta)")
        print("💰 Monto mínimo de apertura: S/ \(String(format: "%.2f", montoMinimoApertura))")
    }
}

class ClienteNatural: Cliente {
    let nombreCompleto: String
    let dni: String

    init(nombreCompleto: String, dni: String, codigo: String, direccion: String,
         fechaDeRegistro: String, numeroCuenta: String, montoMinimoApertura: Double) {
        self.nombreCompleto = nombreCompleto
        self.dni = dni
        super.init(codigo: codigo, direccion: direccion, fechaDeRegistro: fechaDeRegistro,
                   numeroCuenta: numeroCuenta, montoMinimoApertura: montoMinimoApertura)
    }

    override func mostrarDatos() {
        print("👤 Cliente Natural:")
        print("Nombre: \(nombreCompleto)")
        print("DNI: \(dni)")
        super.mostrarDatos()            // reutiliza la parte común de la clase base
    }
}

class ClienteJuridico: Cliente {
    let razonSocial: String
    let ruc: String
    let representanteLegal: String

    init(razonSocial: String, ruc: String, representanteLegal: String, codigo: String, direccion: String,
         fechaDeRegistro: String, numeroCuenta: String, montoMinimoApertura: Double) {
        self.razonSocial = razonSocial
        self.ruc = ruc
        self.representanteLegal = representanteLegal
        super.init(codigo: codigo, direccion: direccion, fechaDeRegistro: fechaDeRegistro,
                   numeroCuenta: numeroCuenta, montoMinimoApertura: montoMinimoApertura)
    }

    override func mostrarDatos() {
        print("🏢 Cliente Jurídico:")
        print("Razón Social: \(razonSocial)")
        print("RUC: \(ruc)")
        print("Representante Legal: \(representanteLegal)")
        super.mostrarDatos()
    }
}

let clientes: [Cliente] = [
    ClienteNatural(nombreCompleto: "Juan Pérez", dni: "12345678", codigo: "C001",
                   direccion: "Av. Lima 123", fechaDeRegistro: "2025-04-03",
                   numeroCuenta: "001-2025-000123", montoMinimoApertura: 500),
    ClienteJuridico(razonSocial: "Soluciones SAC", ruc: "20123456789", representanteLegal: "María León",
                    codigo: "C002", direccion: "Jr. Empresas 456", fechaDeRegistro: "2025-04-01",
                    numeroCuenta: "001-2025-000456", montoMinimoApertura: 3000)
]
for i in 0..<clientes.count {
    clientes[i].mostrarDatos()           // polimorfismo: cada objeto usa su propio override
    if i < clientes.count - 1 {
        print(String(repeating: "-", count: 22))
    }
}
