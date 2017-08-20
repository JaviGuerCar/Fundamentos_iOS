//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource : ArrayDataSource<Element>
    // Deberes
    let miDelegate : ArrayTableViewDelegate<Element>?

    
    init(dataSource: ArrayDataSource<Element>, miDelegate: ArrayTableViewDelegate<Element>!, title: String, style:UITableViewStyle){
        
        self.dataSource = dataSource
        self.miDelegate = miDelegate
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        miDelegate.setTableController(tableViewController: self)
        tableView.delegate = miDelegate
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
