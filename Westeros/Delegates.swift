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

// Creo el delegado para Houses
final class HousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
                let vc = HouseViewController(model: house)
                nav.pushViewController(vc, animated: true)
        }
    }
}

// Creo el delegado para Seasons
final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
            let vc = SeasonViewController(model: season)
            nav.pushViewController(vc, animated: true)
        }
    }
}

// Creo el delegado para Epidoses
final class EpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
