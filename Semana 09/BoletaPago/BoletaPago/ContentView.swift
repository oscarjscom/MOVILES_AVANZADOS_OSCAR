import SwiftUI
import UIKit

struct ContentView: View {
    @State private var sueldoBasico = ""
    @State private var diasLaborados = "30"
    @State private var tieneHijos = "No"
    @State private var sistemaPension = "ONP"
    @State private var afp = "AFP Ejemplo"
    @State private var horasExtras25 = "0"
    @State private var horasExtras35 = "0"
    @State private var adelantos = "0"
    @State private var boleta: Boleta?
    @State private var mensaje = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Boleta de ejemplo")
                    .font(.title)
                    .bold()
                formulario
                Button("Calcular") {
                    calcular()
                }
                .buttonStyle(.borderedProminent)
                if !mensaje.isEmpty {
                    Text(mensaje)
                        .foregroundColor(.red)
                }
                if let boleta = boleta {
                    BoletaView(boleta: boleta)
                }
            }
            .padding()
        }
    }

    private var formulario: some View {
        VStack(alignment: .leading, spacing: 12) {
            campo("Sueldo básico", "Ej. 2500.00", $sueldoBasico, teclado: .decimalPad)
            campo("Días laborados", "1 a 30", $diasLaborados, teclado: .numberPad)
            HStack {
                Text("¿Tiene hijos?")
                    .frame(width: 150, alignment: .leading)
                Picker("¿Tiene hijos?", selection: $tieneHijos) {
                    Text("No").tag("No")
                    Text("Sí").tag("Sí")
                }
                .pickerStyle(.segmented)
            }
            HStack {
                Text("Sistema de pensiones")
                    .frame(width: 150, alignment: .leading)
                Picker("Sistema de pensiones", selection: $sistemaPension) {
                    Text("ONP").tag("ONP")
                    Text("AFP").tag("AFP")
                }
                .pickerStyle(.segmented)
            }
            if sistemaPension == "AFP" {
                HStack {
                    Text("AFP")
                        .frame(width: 150, alignment: .leading)
                    Picker("AFP", selection: $afp) {
                        Text("AFP Ejemplo").tag("AFP Ejemplo")
                        Text("Habitat").tag("Habitat")
                        Text("Integra").tag("Integra")
                        Text("Prima").tag("Prima")
                        Text("Profuturo").tag("Profuturo")
                    }
                }
            }
            campo("Horas extras al 25%", "0", $horasExtras25, teclado: .decimalPad)
            campo("Horas extras al 35%", "0", $horasExtras35, teclado: .decimalPad)
            campo("Adelantos", "0.00", $adelantos, teclado: .decimalPad)
        }
    }

    private func campo(_ titulo: String, _ ejemplo: String, _ valor: Binding<String>, teclado: UIKeyboardType) -> some View {
        HStack {
            Text(titulo)
                .frame(width: 150, alignment: .leading)
            TextField(ejemplo, text: valor)
                .keyboardType(teclado)
                .textFieldStyle(.roundedBorder)
        }
    }

    private func numero(_ texto: String) -> Double? {
        let limpio = texto.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ".")
        return limpio.isEmpty ? 0 : Double(limpio)
    }

    private func calcular() {
        boleta = nil
        guard let sueldo = numero(sueldoBasico), sueldo > 0 else {
            mensaje = "El sueldo básico debe ser un número mayor que cero."
            return
        }
        guard let dias = Int(diasLaborados.trimmingCharacters(in: .whitespaces)), dias >= 1, dias <= 30 else {
            mensaje = "Los días laborados deben ser un número entero entre 1 y 30."
            return
        }
        guard let horas25 = numero(horasExtras25), horas25 >= 0 else {
            mensaje = "Las horas extras al 25% deben ser un número mayor o igual a cero."
            return
        }
        guard let horas35 = numero(horasExtras35), horas35 >= 0 else {
            mensaje = "Las horas extras al 35% deben ser un número mayor o igual a cero."
            return
        }
        guard let adelanto = numero(adelantos), adelanto >= 0 else {
            mensaje = "Los adelantos deben ser un número mayor o igual a cero."
            return
        }
        mensaje = ""
        boleta = Boleta(datos: DatosTrabajador(
            sueldoBasico: sueldo,
            diasLaborados: dias,
            tieneHijos: tieneHijos == "Sí",
            sistemaPension: sistemaPension,
            afp: afp,
            horasExtras25: horas25,
            horasExtras35: horas35,
            adelantos: adelanto
        ))
    }
}

struct BoletaView: View {
    let boleta: Boleta

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            VStack(alignment: .leading, spacing: 6) {
                Text("REMUNERACIONES")
                    .font(.caption)
                    .bold()
                fila(boleta.remuneraciones[0])
                fila(boleta.remuneraciones[1])
                fila(boleta.remuneraciones[2])
                fila(boleta.remuneraciones[3])
                fila(Concepto(nombre: "Total remuneraciones", monto: boleta.totalRemuneraciones), negrita: true)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("RETENCIONES / DESCUENTOS")
                    .font(.caption)
                    .bold()
                fila(boleta.descuentos[0])
                fila(boleta.descuentos[1])
                fila(boleta.descuentos[2])
                fila(boleta.descuentos[3])
                fila(boleta.descuentos[4])
                fila(Concepto(nombre: "Total descuentos", monto: boleta.totalDescuentos), negrita: true)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("APORTACIONES DEL EMPLEADOR")
                    .font(.caption)
                    .bold()
                fila(Concepto(nombre: "EsSalud (9%)", monto: boleta.essalud))
            }
            Text("NETO A PAGAR: S/ \(formatoMonto(boleta.netoAPagar))")
                .font(.title3)
                .bold()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private func fila(_ concepto: Concepto, negrita: Bool = false) -> some View {
        HStack {
            Text(concepto.nombre)
                .fontWeight(negrita ? .bold : .regular)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(formatoMonto(concepto.monto))
                .fontWeight(negrita ? .bold : .regular)
        }
    }
}
