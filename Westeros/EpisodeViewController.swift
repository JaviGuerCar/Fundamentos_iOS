//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 24/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var dateViewLabel: UILabel!
    @IBOutlet weak var synopsisViewLabel: UILabel!
    
    let model : Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButton(){
        // Creo el botón
        let personBtn = UIBarButtonItem(title: "Persons",
                                         style: .plain,
                                         target: self,
                                         action: #selector(displayPersons))
        
        //añado el boton al Navigationitem
        navigationItem.rightBarButtonItem = personBtn
    }
    
    @objc func displayPersons(){
        
        // Creamos un PersonsVC
        let personsVC = PersonsTableViewController(model:model.sortedMembers())
        
        // lo cargamos en el Navigation
        navigationController?.pushViewController(personsVC, animated: true)
        
    }
    
    func syncModelWithView(){
        
        // Formateo de fechas
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        titleViewLabel.text = model.title
        dateViewLabel.text = dateFormatter.string(from: model.issueDate)
        synopsisViewLabel.text = model.synopsis
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // llamo a la funcion de sincronización
        syncModelWithView()
        addButton()
        
    }
    

}
