//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 20/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {
    @IBOutlet weak var seasonView: UILabel!

    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // Creamos una variable que defina el modelo
    let model : Season
    
    init(model: Season){
        // Asigno la variables a la del inicializador
        self.model = model
        // Llamo al init designado
        super .init(nibName: nil, bundle: nil)
        // Le damos nombre al UIViewController
        self.title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcion que sincroniza modelo y vista
    func syncModelWithView(){
        
        // Formateo de fechas
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        seasonView.text = model.name
        dateView.text = dateFormatter.string(from: model.releaseDate)
        imageView.image = model.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // llamo a la funcion de sincronización
        syncModelWithView()
        addButton()
        
    }
    
    func addButton(){
        // Creo el botón
        let episodeBtn = UIBarButtonItem(title: "Episodes",
                                         style: .plain,
                                         target: self,
                                         action: #selector(displayEpisodes))
        
        //añado el boton al Navigationitem
        navigationItem.rightBarButtonItem = episodeBtn
    }
    
    @objc func displayEpisodes(){
        // Aqui hago la funcionalidad para mostrar episodios
        // Creo un EpisodesTableViewController
        let episodeVC = EpisodesTableViewController(model: model.sortedEpisodes())
        
        // lo cargamos
        navigationController?.pushViewController(episodeVC, animated: true)
        
    }

}
