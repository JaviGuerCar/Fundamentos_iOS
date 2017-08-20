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
    let wikiURL : URL
    private var _members : Members
    
    // Hay que crear un inicializador
    init (name: String, sigil: Sigil, words: Words, wikiURL: URL){
        // Usamos Pattern Matching
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, wikiURL)
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
        // Para validar parámetros utilizamos Guard que es como un if pero con más cosas
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
    
    // Variadic version //Sobreescribimos la función Add
    // Person... puede recibir varios parámetro
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        // Con sorted sobre el set te devuelve un Array ordenado. Para ello tenemos que implementar Comparable en Person
        return _members.sorted()
    }
    
    
    func getPerson(named: String) -> Person? {
        return (_members.filter { $0.name == named ? true : false }).first
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

// Implementamos los protocolos
// MARK: - Equatable
extension House : Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyforEquality == rhs.proxyforEquality
    }
}

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

