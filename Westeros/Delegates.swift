//
//  Delegates.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 29/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject{
    
    //declaro las variables del tipo que necesito: DataSource y ViewController
    var source : ArrayDataSource<Element>?
    var viewController : UIViewController?
    
}

final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
                let vc = HouseViewController(model: house)
                nav.pushViewController(vc, animated: true)
        }
    }
}
