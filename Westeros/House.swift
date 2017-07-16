//
//  House.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

typealias Words = String
// Creo un typealias de un conjunto de personas
typealias Members = Set<Person>

// MARK: - Classes
final class House {
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    private var _members : Members
    
    // Hay que crear un inicializador
    init (name: String, sigil: Sigil, words: Words){
        // Usamos Pattern Matching
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
}

final class Sigil {
    
    let description : String
    let image       : UIImage
    
    // Inicializador
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
    
}

extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        // Para validar parámetros utilizamos Guard
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
    
}

// Creamos un proxy que representa el objeto y que averigue el hash
extension House {
    var proxyforEquality : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyforComparison : String{
        get{
            return name
        }
    }
}

// MARK: - Equatable
extension House : Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyforEquality == rhs.proxyforEquality
    }
}

// Implementamos los protocolos
// MARK: - Hashable
extension House : Hashable {
    var hashValue: Int {
        get {
            return proxyforEquality.hashValue
        }
    }
}

// MARK: - Comparable (Tienes un orden)
extension House : Comparable {
    static func < (lhs: House, rhs: House) -> Bool {
        return lhs.proxyforComparison < rhs.proxyforComparison
    }
}

