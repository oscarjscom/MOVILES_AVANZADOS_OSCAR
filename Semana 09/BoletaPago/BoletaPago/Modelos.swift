import Foundation

struct DatosTrabajador {
    let sueldoBasico: Double
    let diasLaborados: Int
    let tieneHijos: Bool
    let sistemaPension: String
    let afp: String
    let horasExtras25: Double
    let horasExtras35: Double
    let adelantos: Double
}

struct TasasAFP {
    let fondo: Double
    let comision: Double
    let seguro: Double
}

struct Concepto {
    let nombre: String
    let monto: Double
}

enum Parametros {
    static let rmv = 1230.0
    static let porcentajeAsignacionFamiliar = 0.10
    static let tasaONP = 0.13
    static let tasaEsSalud = 0.09
    static let diasDelMes = 30.0
    static let horasPorDia = 8.0
    static let recargoHorasExtras25 = 1.25
    static let recargoHorasExtras35 = 1.35
    static let tasasAFP: [String: TasasAFP] = [
        "AFP Ejemplo": TasasAFP(fondo: 0.10, comision: 0.016, seguro: 0.0135),
        "Habitat": TasasAFP(fondo: 0.10, comision: 0.0147, seguro: 0.0137),
        "Integra": TasasAFP(fondo: 0.10, comision: 0.0155, seguro: 0.0137),
        "Prima": TasasAFP(fondo: 0.10, comision: 0.0160, seguro: 0.0137),
        "Profuturo": TasasAFP(fondo: 0.10, comision: 0.0169, seguro: 0.0137)
    ]
}

func redondear(_ valor: Double) -> Double {
    (valor * 100).rounded() / 100
}

func formatoMonto(_ valor: Double) -> String {
    let formato = NumberFormatter()
    formato.locale = Locale(identifier: "en_US")
    formato.numberStyle = .decimal
    formato.minimumFractionDigits = 2
    formato.maximumFractionDigits = 2
    return formato.string(from: NSNumber(value: valor)) ?? String(format: "%.2f", valor)
}
