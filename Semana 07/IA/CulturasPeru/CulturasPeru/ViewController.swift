//
//  ViewController.swift
//  CulturasPeru
//
//  Created by oscarolano15@gmail.com on 13/10/26.
//

import UIKit

class CulturaCell: UITableViewCell {
    @IBOutlet weak var imgCultura: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tablaCulturas: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tablaCulturas.dataSource = self
        tablaCulturas.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return culturasPeruanas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCultura", for: indexPath) as! CulturaCell
        let cultura = culturasPeruanas[indexPath.row]
        celda.imgCultura.image = imagenElemento(cultura.imagen)
        celda.lblNombre.text = cultura.nombre
        celda.lblRegion.text = "Region: \(cultura.region)"
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarElementos",
           let celda = sender as? UITableViewCell,
           let indexPath = tablaCulturas.indexPath(for: celda),
           let destino = segue.destination as? ElementosViewController {
            destino.cultura = culturasPeruanas[indexPath.row]
        }
    }
}
