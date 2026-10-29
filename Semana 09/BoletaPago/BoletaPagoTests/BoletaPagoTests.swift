import XCTest
@testable import BoletaPago

final class BoletaPagoTests: XCTestCase {

    func testCaso1SinHijosONPMesCompleto() {
        let boleta = Boleta(datos: DatosTrabajador(sueldoBasico: 2500, diasLaborados: 30, tieneHijos: false,
                                                   sistemaPension: "ONP", afp: "AFP Ejemplo",
                                                   horasExtras25: 0, horasExtras35: 0, adelantos: 0))
        XCTAssertEqual(boleta.totalRemuneraciones, 2500.00, accuracy: 0.001)
        XCTAssertEqual(boleta.descuentos[0].monto, 325.00, accuracy: 0.001)
        XCTAssertEqual(boleta.netoAPagar, 2175.00, accuracy: 0.001)
        XCTAssertEqual(boleta.essalud, 225.00, accuracy: 0.001)
    }

    func testCaso2ConHijosYDiasIncompletos() {
        let boleta = Boleta(datos: DatosTrabajador(sueldoBasico: 1800, diasLaborados: 27, tieneHijos: true,
                                                   sistemaPension: "ONP", afp: "AFP Ejemplo",
                                                   horasExtras25: 0, horasExtras35: 0, adelantos: 0))
        XCTAssertEqual(boleta.remuneraciones[0].monto, 1620.00, accuracy: 0.001)
        XCTAssertEqual(boleta.remuneraciones[1].monto, 123.00, accuracy: 0.001)
        XCTAssertEqual(boleta.totalRemuneraciones, 1743.00, accuracy: 0.001)
        XCTAssertEqual(boleta.descuentos[0].monto, 226.59, accuracy: 0.001)
        XCTAssertEqual(boleta.netoAPagar, 1516.41, accuracy: 0.001)
        XCTAssertEqual(boleta.essalud, 156.87, accuracy: 0.001)
    }

    func testCaso3AFPHorasExtrasYAdelanto() {
        let boleta = Boleta(datos: DatosTrabajador(sueldoBasico: 3000, diasLaborados: 30, tieneHijos: true,
                                                   sistemaPension: "AFP", afp: "AFP Ejemplo",
                                                   horasExtras25: 4, horasExtras35: 4, adelantos: 200))
        XCTAssertEqual(boleta.remuneraciones[2].monto, 62.50, accuracy: 0.001)
        XCTAssertEqual(boleta.remuneraciones[3].monto, 67.50, accuracy: 0.001)
        XCTAssertEqual(boleta.totalRemuneraciones, 3253.00, accuracy: 0.001)
        XCTAssertEqual(boleta.descuentos[1].monto, 325.30, accuracy: 0.001)
        XCTAssertEqual(boleta.descuentos[2].monto, 52.05, accuracy: 0.001)
        XCTAssertEqual(boleta.descuentos[3].monto, 43.92, accuracy: 0.001)
        XCTAssertEqual(boleta.totalDescuentos, 621.27, accuracy: 0.001)
        XCTAssertEqual(boleta.netoAPagar, 2631.73, accuracy: 0.001)
        XCTAssertEqual(boleta.essalud, 292.77, accuracy: 0.001)
    }
}
