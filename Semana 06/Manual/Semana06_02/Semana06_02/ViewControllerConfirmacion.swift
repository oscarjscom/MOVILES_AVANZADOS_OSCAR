//
//  ViewControllerConfirmacion.swift
//  Semana06_02
//
//  Created by Oscar Olano on 3/10/26.
//

import UIKit

class ViewControllerConfirmacion: UIViewController {
    //instanciar la clase ClienteModel
    var pCliente: ClienteModel = ClienteModel()

    //    definir los controles
    @IBOutlet weak var tfApellido: UILabel!
    @IBOutlet weak var tfNombre: UILabel!
    @IBOutlet weak var tfDni: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //        mostrar los datos recibidos
        self.tfApellido.text = pCliente.Apellido
        self.tfNombre.text = pCliente.Nombre
        self.tfDni.text = pCliente.Dni
    }

    // Cierra la ventana modal y regresa a DATOS DEL CLIENTE
    @IBAction func btnVolver(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
