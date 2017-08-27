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
    
    // Añadimos con una función un botón a la barra del navigationController
    func addButtons(){
        // Tenemos que darle el texto al botón
        let wikiBtn = UIBarButtonItem(title: "Wiki",
                                      style: .plain,
                                      target: self,
                                      //Con selector llama a la funcion
            action: #selector(displayWiki))
        
        // Añadimos otro Botón
        let personBtn = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      //Con selector llama a la funcion
            action: #selector(displayPerson))
        // Y lo añadimos con un NavigationItem,
        // que es una propiedad de UIViewController
        navigationItem.rightBarButtonItems = [wikiBtn, personBtn]
        
    }
    
    // Esta función se tiene que llamar con los métodos de ObjectiveC al llamarla con selector en el Botón, por
    // culpa de que UIKit está implementado en OBJC
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    @objc func displayPerson(){
        
        // Creamos un PersonsVC
        let personsVC = PersonsTableViewController(model:model.sortedMembers())
        
        // lo cargamos en el Navigation
        navigationController?.pushViewController(personsVC, animated: true)
        
    }
    
    
    // en el método viewVillAppear llamamos a la función que sincroniza modelo y vista
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
        //Otra funcion para configurar la vista
        addButtons()
    }



}
