//
//  Season.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 15/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

//Creo un typealias para un conjunto de Episodios
typealias Episodes = Set<Episode>

final class Season{
  
    // Declaro las variables
    let name       : String
    let releaseDate       : Date
    private var _episodes    : Episodes
    
    init(name: String, releaseDate: Date) {
        (self.name, self.releaseDate) = (name, releaseDate)
        _episodes = Episodes()
    }
    
}

// Extension de la clase para desarrollar unos métodos
extension Season{
    
    // Variable computada que me devuelve la cantidad de Episodes
    var count :Int {
        get{
            return _episodes.count
        }
    }
    
    // Método para añadir Episodes
    func add(episode: Episode){
        // Compruebo que el Episode pertenece a la Season correcta, si no es así sale y no lo añade
        guard episode.season == self else {
            return
        }
        _episodes.insert(episode)
    }
    
    // Variadic version //Sobreescribimos la función Add
    // Season... puede recibir varios parámetros
    // Método para añadir varios episodes
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
        
    }
}

// Implementamos los protocolos
// Primero creamos el proxy
extension Season {
    var proxy:String{
        get {
            return "\(name) \(releaseDate)"
        }
    }
}

// MARK: - Equatable
extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MARK: - Comparable
extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

// MARK: - Hashable
extension Season : Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible{
    var description: String {
        get {
            return "<\(type(of: self)): \(name)>"
        }
    }
}

