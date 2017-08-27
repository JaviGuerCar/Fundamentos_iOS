//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
        
    let model : [House]
    
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = "Houses"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    
    // Numero de secciones
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Numero de filas en seccion
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    // Método que devuelve la celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrimos cual es la casa a mostrar
        let house = model[indexPath.row]
        
        // Creamos un identificador para la celda
        let cellID = "HouseCell"
        
        // Le pedimos al tableView que nos de una celda reusada
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        // Sino la tiene la creamos a pelo
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Sincronizamos House y Celda
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        cell?.detailTextLabel?.text = "\(house.count) members"
        
        // Devolvemos la celda si o si
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Descubrimos cual es la casa a mostrar
        let house = model[indexPath.row]
        
        // La mostramos
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
    
}
