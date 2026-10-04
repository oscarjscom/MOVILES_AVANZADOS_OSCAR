//
//  ResultadoViewController.swift
//  VentaPlazos
//
//  Created by Oscar Olano on 3/10/26.
//

import UIKit

// Pantalla "Resultado": muestra los valores del VentaModel formateados en soles.
class ResultadoViewController: UIViewController {

    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblIgv: UILabel!
    @IBOutlet weak var lblBase: UILabel!
    @IBOutlet weak var lblIntereses: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblCuota: UILabel!

    var venta: VentaModel = VentaModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblSubtotal.text = soles(venta.subtotal)
        lblIgv.text = soles(venta.igv)
        lblBase.text = soles(venta.base)
        lblIntereses.text = soles(venta.intereses)
        lblTotal.text = soles(venta.total)
        lblCuota.text = soles(venta.cuota)
    }

    func soles(_ valor: Double) -> String {
        return String(format: "S/. %.2f", valor)
    }
}
