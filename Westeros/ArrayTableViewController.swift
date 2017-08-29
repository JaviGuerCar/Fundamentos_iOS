//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 29/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController{
    
    let dataSource: ArrayDataSource<Element>
    let delegate: BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>,
         delegate: BaseViewControllerDelegate<Element>,
         title: String, style: UITableViewStyle){
        
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        self.tableView.dataSource = dataSource
        
        self.delegate?.viewController = self
        self.delegate?.source = dataSource
        
        self.tableView.delegate = self.delegate as? UITableViewDelegate
        
        self.title = title
        
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
    }

}
