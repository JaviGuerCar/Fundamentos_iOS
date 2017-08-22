//
//  SeasonsTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 21/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonsTableViewController: UITableViewController {
        
    let model : [Season]
    
    init(model: [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrimos la season a mostrar
        let season = model[indexPath.row]
        
        // Creamos un ID para la celda
        let cellID = "SeasonCell"
        
        // Le pedimos al tableView que nos de una celda reusada
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        // Si no tiene la celda, la creamos
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Sincronizamos vista y celda
        // Formateo de fechas
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = dateFormatter.string(from: season.releaseDate)
        
        // Devolvemos la celda
        return cell!
        
    }
    

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Descubrimos cual es la casa a mostrar
        let season = model[indexPath.row]
        
        // La mostramos
        let seasonVC = SeasonViewController(model: season)
        navigationController?.pushViewController(seasonVC, animated: true)
    }
    
}
