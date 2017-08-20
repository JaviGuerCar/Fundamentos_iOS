//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element> : NSObject, UITableViewDelegate{
    
    typealias Elements = [Element]
    typealias vMaker = (Element, UITableView, UINavigationController?) -> ()

    
    let model : Elements
    private let _vMaker : vMaker
    private var _myTableVC : UITableViewController?
    
    init(model: Elements, viewMaker: @escaping vMaker){
        
        self.model = model
        _vMaker = viewMaker
        super.init()
    }
    
    public func setTableController(tableViewController: UITableViewController){
        _myTableVC = tableViewController
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Que pasa aquí dentro?
        // Descubrimos cual es la casa a mostrar
        let elem = model[indexPath.row]
        
        // La mostramos
        return _vMaker(elem, tableView, _myTableVC?.navigationController)
    }
}
