//
//  ViewController.swift
//  VentaPlazos
//
//  Created by Oscar Olano on 3/10/26.
//

import UIKit

// Pantalla "Nueva Venta": lee los datos, calcula y pasa un VentaModel a "Resultado".
class ViewController: UIViewController {

    @IBOutlet weak var tfProducto: UITextField!
    @IBOutlet weak var tfPrecio: UITextField!
    @IBOutlet weak var tfCantidad: UITextField!
    @IBOutlet weak var tfMeses: UITextField!
    @IBOutlet weak var tfInteres: UITextField!

    var venta: VentaModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Aplica las formulas del enunciado. Devuelve nil si algun dato no es valido.
    func calcularVenta() -> VentaModel? {
        guard let precio = numero(tfPrecio), precio > 0,
              let cantidad = numero(tfCantidad), cantidad > 0,
              let meses = numero(tfMeses), meses > 0,
              let tasa = numero(tfInteres), tasa >= 0 else {
            return nil
        }
        let subtotal = precio * cantidad
        let igv = subtotal * 0.18
        let base = subtotal + igv
        let intereses = base * (tasa / 100) * meses
        let total = base + intereses
        let cuota = total / meses
        return VentaModel(subtotal: subtotal, igv: igv, base: base,
                          intereses: intereses, total: total, cuota: cuota)
    }

    // Convierte el texto a Double aceptando coma o punto decimal
    func numero(_ campo: UITextField) -> Double? {
        let texto = (campo.text ?? "").replacingOccurrences(of: ",", with: ".")
        return Double(texto)
    }

    // Se ejecuta antes del segue "showResultado": si los datos no son validos, no navega
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showResultado" {
            venta = calcularVenta()
            if venta == nil {
                let alerta = UIAlertController(title: "Datos incompletos",
                                               message: "Ingresa precio, cantidad y meses mayores a 0, y un interés válido.",
                                               preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .default))
                present(alerta, animated: true)
                return false
            }
        }
        return true
    }

    // Pasa el VentaModel a la pantalla Resultado (igual que en el Ejercicio 2)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultado",
           let destino = segue.destination as? ResultadoViewController {
            destino.venta = venta ?? VentaModel()
            destino.title = tfProducto.text?.isEmpty == false ? tfProducto.text : "Resultado"
        }
    }
}
