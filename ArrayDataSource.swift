//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 28/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayDataSource <Element> : NSObject, UITableViewDataSource {
    
    // Creo un tipo que define una clausura
    // que recibe un elemento (Person, House) para configurar la celda
    // y recibe una tabla (para re-aprovechar las celdas)
    // y devuelve una celda configurada
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    // Creo las variables para el modelo y la celda
    private let _model : [Element]
    private let _cellMaker : CellMaker
    
    // inicializo
    init(model: [Element], cellMaker:  @escaping CellMaker ){
        _model = model
        _cellMaker = cellMaker
    }
    
    // función que devuelve el elemento del array según el IndexPath
    func element(atIndexPath indexPath: IndexPath) -> Element{
        return _model[indexPath.row]
    }
    
    
    // DATA SOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    // Método que obtiene el elemento y llama a la clausura que crea la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elem = element(atIndexPath: indexPath)
        return _cellMaker(elem, tableView)
    }

    
}
