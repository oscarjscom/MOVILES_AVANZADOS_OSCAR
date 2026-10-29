import Foundation

class Boleta {
    let datos: DatosTrabajador
    private(set) var remuneraciones: [Concepto] = []
    private(set) var descuentos: [Concepto] = []
    private(set) var essalud = 0.0

    init(datos: DatosTrabajador) {
        self.datos = datos
        calcularRemuneraciones()
        calcularDescuentos()
        essalud = redondear(totalRemuneraciones * Parametros.tasaEsSalud)
    }

    var valorHora: Double {
        datos.sueldoBasico / Parametros.diasDelMes / Parametros.horasPorDia
    }

    var totalRemuneraciones: Double {
        redondear(remuneraciones.reduce(0) { $0 + $1.monto })
    }

    var totalDescuentos: Double {
        redondear(descuentos.reduce(0) { $0 + $1.monto })
    }

    var netoAPagar: Double {
        redondear(totalRemuneraciones - totalDescuentos)
    }

    private func calcularRemuneraciones() {
        let sueldoComputable = redondear(datos.sueldoBasico / Parametros.diasDelMes * Double(datos.diasLaborados))
        let asignacionFamiliar = datos.tieneHijos ? redondear(Parametros.rmv * Parametros.porcentajeAsignacionFamiliar) : 0
        let horasExtras25 = redondear(valorHora * Parametros.recargoHorasExtras25 * datos.horasExtras25)
        let horasExtras35 = redondear(valorHora * Parametros.recargoHorasExtras35 * datos.horasExtras35)
        remuneraciones = [
            Concepto(nombre: "Sueldo computable", monto: sueldoComputable),
            Concepto(nombre: "Asignación familiar", monto: asignacionFamiliar),
            Concepto(nombre: "Horas extras 25%", monto: horasExtras25),
            Concepto(nombre: "Horas extras 35%", monto: horasExtras35)
        ]
    }

    private func calcularDescuentos() {
        let total = totalRemuneraciones
        var onp = 0.0
        var afpFondo = 0.0
        var afpComision = 0.0
        var afpSeguro = 0.0
        if datos.sistemaPension == "ONP" {
            onp = redondear(total * Parametros.tasaONP)
        } else if let tasas = Parametros.tasasAFP[datos.afp] {
            afpFondo = redondear(total * tasas.fondo)
            afpComision = redondear(total * tasas.comision)
            afpSeguro = redondear(total * tasas.seguro)
        }
        descuentos = [
            Concepto(nombre: "ONP", monto: onp),
            Concepto(nombre: "AFP fondo", monto: afpFondo),
            Concepto(nombre: "AFP comisión", monto: afpComision),
            Concepto(nombre: "AFP seguro", monto: afpSeguro),
            Concepto(nombre: "Adelantos", monto: redondear(datos.adelantos))
        ]
    }
}
