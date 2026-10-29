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
}
