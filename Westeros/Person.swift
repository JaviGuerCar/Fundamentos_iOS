//
//  Character.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

final class Person {
    
    let name    : String
    let house   : House
    private let _alias   : String?
    
    var alias : String{
        get{
            // Esto es un if que hace una asignación si se cumple
//            if let theAlias = _alias{
//                //nExiste! y está en theAlias
//                return theAlias
//            }else{
//                return ""
//            }
            // Esto significa: me devuelves _alias si tiene algo y sino me devuelves ""
            return _alias ?? ""
        }
    }
    
    // Init
    init(name: String, alias: String?, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    // Init para cuando no tiene alias
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
    
}

extension Person {
    var fullName : String{
        get{
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    // Creamos un proxy que represnta el objeto y que averigue el hash
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}

// Añado el protocolo Hashable a la clase Person
extension Person : Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

// Añado el protocolo Equatable a la clase Person
extension Person : Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

//Implemento el protocolo Comparable 
extension Person : Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}






