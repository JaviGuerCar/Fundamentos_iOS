//
//  Delegates.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Delegates {
    
    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House>{
        
        // Que va aqui?
        return ArrayTableViewDelegate<House>(model: model, viewMaker: { (house: House, tableView: UITableView, navigationController: UINavigationController?) in
           
            let houseVC = HouseViewController(model: house)
            navigationController?.pushViewController(houseVC, animated: true)
        })
                   
    }
    
//    static func personDelegate(model: [Person]) -> ArrayTableViewDelegate<Person>{
//        
//        // Que va aqui?
//        return ArrayTableViewDelegate<Person>(model: model)
//    }
}
