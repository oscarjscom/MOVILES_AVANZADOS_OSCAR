//
//  ViewController.swift
//  Semana05_Prestamos
//
//  Created by Oscar Olano on 3/10/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var capitalTextField: UITextField!
    @IBOutlet weak var tasaTextField: UITextField!
    @IBOutlet weak var plazoTextField: UITextField!
    @IBOutlet weak var mensajeLabel: UILabel!
    @IBOutlet weak var cuotaLabel: UILabel!
    @IBOutlet weak var interesLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        mensajeLabel.text = "Introduce los datos del préstamo"
    }

    @IBAction func CalcularPrestamo(_ sender: Any) {
        // Ocultar el teclado
        view.endEditing(true)

        // Obtener capital, tasa de interés anual y plazo en años
        let capital = Double(capitalTextField.text ?? "") ?? 0
        let tasaAnual = Double(tasaTextField.text ?? "") ?? -1
        let anios = Double(plazoTextField.text ?? "") ?? 0

        // Verificar si los valores de entrada son válidos
        if capital <= 0 || tasaAnual < 0 || anios <= 0 {
            mensajeLabel.text = "Por favor, ingresa valores válidos."
            cuotaLabel.text = "-"
            interesLabel.text = "-"
            totalLabel.text = "-"
            return
        }

        // r = tasa mensual (anual / 12) y n = número total de pagos (años x 12)
        let r = tasaAnual / 100 / 12
        let n = anios * 12

        // Fórmula de amortización: M = P x r(1+r)^n / ((1+r)^n - 1)
        var cuota = 0.0
        if r == 0 {
            cuota = capital / n          // sin interés: solo se divide el capital
        } else {
            let factor = pow(1 + r, n)
            cuota = capital * (r * factor) / (factor - 1)
        }

        // Monto total = cuota mensual x número total de pagos
        let total = cuota * n
        let intereses = total - capital

        // Mostrar el resultado
        mensajeLabel.text = "\(Int(n)) cuotas mensuales"
        cuotaLabel.text = String(format: "S/. %.2f", cuota)
        interesLabel.text = String(format: "S/. %.2f", intereses)
        totalLabel.text = String(format: "S/. %.2f", total)
    }
}
