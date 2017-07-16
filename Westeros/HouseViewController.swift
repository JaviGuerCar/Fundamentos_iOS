//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 10/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsView: UILabel!

    @IBOutlet weak var sigilImageView: UIImageView!
    

    // necesitamos una variable que defina al modelo
    let model : House
    
    init(model: House){
        // asignar las varibales
        self.model = model
        // llamamos al inicializador designado
        super.init(nibName: nil, bundle: nil)
        // Nombramos los botones del UITabBarItem
        self.title = model.name
        
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // sincroniza modelo y vista
    func syncViewWithModel(){
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    
    // en el método viewVillAppear llamamos a la función que sincroniza modelo y vista
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        syncViewWithModel()
    }



}
