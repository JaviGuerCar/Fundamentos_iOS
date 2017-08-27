//
//  Episode.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

typealias EpisodePersons = Set<Person>

final class Episode {
    
    let title: String
    let issueDate: Date
    let synopsis : String
    weak var season: Season?
    
    private var _episodePersons : EpisodePersons
    
    
    init(title: String, issueDate: Date, season: Season, synopsis: String){
        (self.title, self.issueDate, self.season, self.synopsis) = (title, issueDate, season, synopsis)
        _episodePersons = EpisodePersons()
    }
    
}

extension Episode{
    
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        // Con sorted sobre el set te devuelve un Array ordenado. Para ello tenemos que implementar Comparable en Person
        return _episodePersons.sorted()
    }
    
    // función para añadir una persona a un episodio
    func add(person: Person){
        
        _episodePersons.insert(person)
    }
    
    // Variadic version //Sobreescribimos la función Add
    // Person... puede recibir varios parámetro
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    //función para añadir arraysdePersonas a Episode
    func add(arrayOfPersons: [Person]){
        for person in arrayOfPersons{
            add(person: person)
        }
    }
}


// Implementamos los protocolos
// Primero creamos el proxy
extension Episode {
    var proxy:String{
        get {
            return "\(title) \(issueDate) \(season!.name)"
        }
    }
}

// MARK: - Equatable
extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MARK: - Comparable
extension Episode: Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

// MARK: - Hashable
extension Episode : Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible{
    var description: String {
        get {
            return "<\(type(of: self)): \(title)>"
        }
    }
}
