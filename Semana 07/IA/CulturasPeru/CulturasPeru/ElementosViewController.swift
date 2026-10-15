//
//  ElementosViewController.swift
//  CulturasPeru
//
//  Created by oscarolano15@gmail.com on 15/10/26.
//

import UIKit

class ElementoCell: UITableViewCell {
    @IBOutlet weak var imgElemento: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
}

class ElementosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tablaElementos: UITableView!

    var cultura: Cultura?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = cultura?.nombre
        tablaElementos.dataSource = self
        tablaElementos.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cultura?.elementos.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaElemento", for: indexPath) as! ElementoCell
        if let elemento = cultura?.elementos[indexPath.row] {
            celda.imgElemento.image = imagenElemento(elemento.imagen)
            celda.lblTitulo.text = elemento.titulo
        }
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarDetalle",
           let celda = sender as? UITableViewCell,
           let indexPath = tablaElementos.indexPath(for: celda),
           let destino = segue.destination as? DetalleElementoViewController {
            destino.elemento = cultura?.elementos[indexPath.row]
            destino.nombreCultura = cultura?.nombre
        }
    }
}
