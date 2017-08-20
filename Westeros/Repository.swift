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
    
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    
    // Defino una función que me da una casa por nombre
    func house(named: String) -> House?
    
    // Defino una función que me da un array de casas filtradas
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory{
    
    // Implemento la función que me da una casa por nombre
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf/westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf/westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              wikiURL: starkURL)
            
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  wikiURL: lannisterURL)
            
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & Blood",
                                  wikiURL: targaryenURL)
            
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kinglsayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
            
            
        }
    }
}

// Creamos un protocolo para crear Seasons para el que lo use debe usar su propiedad houses
protocol SeasonFactory {
    
    typealias FilterSeason = (Season)->Bool
    
    var seasons : [Season] {get}
    
    // Defino una función que me da un array de seasons filtradas
    func seasons(filteredBy: FilterSeason) -> [Season]
}

extension LocalFactory: SeasonFactory{
    
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        get {
            
            // Defino los Dates por Season
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            let dateS1Ep1 = formatter.date(from: "09/05/2011")
            let dateS1Ep2 = formatter.date(from: "16/05/2011")

            let dateS2Ep1 = formatter.date(from: "01/04/2012")
            let dateS2Ep2 = formatter.date(from: "08/04/2012")

            let dateS3Ep1 = formatter.date(from: "01/04/2013")
            let dateS3Ep2 = formatter.date(from: "07/04/2013")
            
            let dateS4Ep1 = formatter.date(from: "06/04/2014")
            let dateS4Ep2 = formatter.date(from: "13/04/2014")
            
            let dateS5Ep1 = formatter.date(from: "12/04/2015")
            let dateS5Ep2 = formatter.date(from: "19/04/2015")
            
            let dateS6Ep1 = formatter.date(from: "24/04/2016")
            let dateS6Ep2 = formatter.date(from: "01/05/2016")
            
            
            // Creo las Seasons
            let season1 = Season(name: "Season1", releaseDate: dateS1Ep1!)
            let season2 = Season(name: "Season2", releaseDate: dateS2Ep1!)
            let season3 = Season(name: "Season3", releaseDate: dateS3Ep1!)
            let season4 = Season(name: "Season4", releaseDate: dateS4Ep1!)
            let season5 = Season(name: "Season5", releaseDate: dateS5Ep1!)
            let season6 = Season(name: "Season6", releaseDate: dateS6Ep1!)
            
            // Creo los Episodes (2 por Season)
            let ep1s1 = Episode(title: "Winter Is Coming", issueDate: dateS1Ep1!, season: season1)
            let ep2s1 = Episode(title: "The Kingsroad", issueDate: dateS1Ep2!, season: season1)
            
            let ep1s2 = Episode(title: "The North Remembers", issueDate: dateS2Ep1!, season: season2)
            let ep2s2 = Episode(title: "The Night Lands", issueDate: dateS2Ep2!, season: season2)
            
            let ep1s3 = Episode(title: "Valar Dohaeris", issueDate: dateS3Ep1!, season: season3)
            let ep2s3 = Episode(title: "Dark Wings, Dark Words", issueDate: dateS3Ep2!, season: season3)
            
            let ep1s4 = Episode(title: "Two Swords", issueDate: dateS4Ep1!, season: season4)
            let ep2s4 = Episode(title: "The Lion and the Rose", issueDate: dateS4Ep2!, season: season4)
            
            let ep1s5 = Episode(title: "The Wars to Come", issueDate: dateS5Ep1!, season: season5)
            let ep2s5 = Episode(title: "The House of Black and White", issueDate: dateS5Ep2!, season: season5)
            
            let ep1s6 = Episode(title: "The Red Woman", issueDate: dateS6Ep1!, season: season6)
            let ep2s6 = Episode(title: "Home", issueDate: dateS6Ep2!, season: season6)
            
            season1.add(episodes: ep1s1, ep2s1)
            season2.add(episodes: ep1s2, ep2s2)
            season3.add(episodes: ep1s3, ep2s3)
            season4.add(episodes: ep1s4, ep2s4)
            season5.add(episodes: ep1s5, ep2s5)
            season6.add(episodes: ep1s6, ep2s6)
            
            return [season1,season2,season3,season4,season5,season6].sorted()
        }
    }
}
