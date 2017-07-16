//
//  Repository.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 11/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory()
}

// Creamos un protocolo para crear casas para el que lo use debe usar su propiedad houses
protocol HouseFactory {
    
    var houses : [House] {get}
}

final class LocalFactory: HouseFactory{
    var houses: [House]{
        get{
            // Aqui es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei",  house: lannister)
            
            // Añadir los personajes a las casas
            
            stark.add(person: robb)
            stark.add(person: arya)
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            
            // Haríamos el return del array ordenado
            return [stark, lannister].sorted()
            
            
        }
    }

    
}
