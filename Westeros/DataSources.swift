//
//  DataSources.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 29/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class DataSources{
    // Creamos las funciones que devuelven los ArrayDataSources del Element(House, person) que necesitamos
    // En esta clase se agrupan estas funciones
    static func houseDataSources(model: [House]) -> ArrayDataSource<House>{
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            // Creo la ID de la celda
            let cellID = "House"
            
            // Busco una celda reusada de una tabla y sino la creo
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            // Sincronizo con la Vista
            cell?.textLabel?.text = house.name
            cell?.imageView?.image = house.sigil.image
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        })
    }
    
    // Ahora creo la función para la clase Person
    static func personDataSources(model: [Person]) -> ArrayDataSource<Person>{
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            // Creo la ID de la celda
            let cellID = "Person"
            
            // Busco una celda reusada de una tabla y sino la creo
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // Sincronizo con la Vista
            cell?.textLabel?.text = person.fullName

            
            return cell!
        })
    }
    
}
