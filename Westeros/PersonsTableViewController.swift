//
//  PersonsTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {
        
    let model : [Person]
    
    init (model:[Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
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
        
        //Creamos un ID de Celda
        let cellID = "PersonCell"
        
        // Descubir la persona a mostrar
        let person = model[indexPath.row]
        
        // Pedir una celda a la tabla
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        // Sino nos da la celda, la creamos a pelo
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar Person y Celda
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }

   
    
}
