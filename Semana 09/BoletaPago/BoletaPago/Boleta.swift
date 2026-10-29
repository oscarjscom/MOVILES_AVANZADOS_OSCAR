import Foundation

class Boleta {
    let datos: DatosTrabajador
    private(set) var remuneraciones: [Concepto] = []

    init(datos: DatosTrabajador) {
        self.datos = datos
        calcularRemuneraciones()
    }

    var valorHora: Double {
        datos.sueldoBasico / Parametros.diasDelMes / Parametros.horasPorDia
    }

    var totalRemuneraciones: Double {
        redondear(remuneraciones.reduce(0) { $0 + $1.monto })
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
}
