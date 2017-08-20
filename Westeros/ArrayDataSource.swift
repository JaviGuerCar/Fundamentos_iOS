//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

// Todo DataSource tiene que ser un NSObject, por eso necesitamos heredar de NSObject
final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    // Tipo genérico de datos
    typealias Elements = [Element]
    
    // Tipo para la Clausura que recibe Element y TableView para devolverme una Celda del Tipo de Element que sea
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    init(model : Elements, cellMaker: @escaping CellMaker){
        // No usamos self porque al llamarse distinto no se confunden
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    // Todo TableViewDataSource como mínimo implementa estos métodos
    
    // numero de celdas en seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return _model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Averiguamos que celda nos piden
        let elem = _model[indexPath.row]
        // Devolvemos la clausura, que en realidad devuelve la celda, que requiere de un elemento y un tableView
        return _cellMaker(elem, tableView)
    }

    
}
