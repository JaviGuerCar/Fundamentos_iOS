//
//  EpisodesTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 22/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
        
    let model : [Episode]
    
    init(model:[Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = "Episodes"
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
        
        // identificamos la celda del episode
        let episode = model[indexPath.row]
        
        // Creamos un ID para la celda
        let cellID = "EpisodeCell"
        
        // Usamos una celda por defecto
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)

        // Sino nos da una celda, la creamos
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Formateo de fechas
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        // Sincronizamos la vista y celda
        cell?.textLabel?.text = episode.title
        cell?.detailTextLabel?.text = dateFormatter.string(from: episode.issueDate)
        
        // Devolvemos la celda
        
        return cell!
    }
 
    
}
