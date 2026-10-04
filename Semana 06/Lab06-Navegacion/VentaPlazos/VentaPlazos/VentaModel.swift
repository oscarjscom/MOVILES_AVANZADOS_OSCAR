//
//  VentaModel.swift
//  VentaPlazos
//
//  Created by Oscar Olano on 3/10/26.
//

import UIKit

// Modelo con las 6 salidas del calculo de la venta a plazos.
// Es class (tipo por referencia) igual que ClienteModel del Ejercicio 2.
class VentaModel: NSObject {
    var subtotal: Double = 0
    var igv: Double = 0
    var base: Double = 0
    var intereses: Double = 0
    var total: Double = 0
    var cuota: Double = 0

    override init() {
        super.init()
    }

    init(subtotal: Double, igv: Double, base: Double, intereses: Double, total: Double, cuota: Double) {
        self.subtotal = subtotal
        self.igv = igv
        self.base = base
        self.intereses = intereses
        self.total = total
        self.cuota = cuota
        super.init()
    }
}
