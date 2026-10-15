//
//  DetalleElementoViewController.swift
//  CulturasPeru
//
//  Created by oscarolano15@gmail.com on 15/10/26.
//

import UIKit

class DetalleElementoViewController: UIViewController {

    @IBOutlet weak var imgDetalle: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblCultura: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!

    var elemento: Elemento?
    var nombreCultura: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let elemento = elemento else { return }
        title = elemento.titulo
        imgDetalle.image = imagenElemento(elemento.imagen)
        lblTitulo.text = elemento.titulo
        lblCultura.text = nombreCultura
        lblDescripcion.text = elemento.descripcion
    }
}
