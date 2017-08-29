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
protocol WesterosFactory {
    
    typealias Filter = (House)->Bool
    typealias FilterSeason = (Season)->Bool
    
    var houses : [House] {get}
    var seasons : [Season] {get}
    
    // Defino una función que me da una casa por nombre
    func house(named: String) -> House?
    
    // Defino una función que me da un array de casas filtradas
    func houses(filteredBy: Filter) -> [House]
    
    
    // Defino una función que me da un array de seasons filtradas
    func seasons(filteredBy: FilterSeason) -> [Season]
}

final class LocalFactory: WesterosFactory{
    
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
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "house_stark.png"), description: "A grey direwolf on a white field")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "house_lannister.png"), description: "A golden lion rampant on a crimson field.")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "house_targaryen.png"), description: "A red three-headed dragon, on a black field")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "house_tyrell.png"), description: "A golden rose on a green field")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "house_greyjoy.png"), description: "A golden kraken on a black field")
            let tullySigil = Sigil(image: #imageLiteral(resourceName: "house_tully.png"), description: "A silver trout leaping on a red and blue background")
            let arrynSigil = Sigil(image: #imageLiteral(resourceName: "house_arryn.png"), description: "A white falcon volant and crescent moon on a blue field")
            let baratheonSigil = Sigil(image: #imageLiteral(resourceName: "house_baratheon.png"), description: "A crowned black stag rampant on a gold field")
            let martellSigil = Sigil(image: #imageLiteral(resourceName: "house_martell.png"), description: "A red sun pierced by a gold spear, on an orange field")
            let freySigil = Sigil(image: #imageLiteral(resourceName: "house_frey.png"), description: "The two stone grey towers and bridge of the Twins, on a dark grey field, surmounting an escutcheon of blue water")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Tyrell")!
            let greyJoyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let tullyURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Tully")!
            let arrynURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Arryn")!
            let baratheonURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!
            let freyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Frey")!
            let martellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Martell")!
            
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
            
            let tyrell = House(name: "Tyrell",
                               sigil: tyrellSigil,
                               words: "Growing Strong",
                               wikiURL: tyrellURL)
            
            let greyjoy = House(name: "Greyjoy",
                               sigil: greyjoySigil,
                               words: "We Do Not Sow",
                               wikiURL: greyJoyURL)
            
            let tully = House(name: "Tully",
                                sigil: tullySigil,
                                words: "Family, Duty, Honor",
                                wikiURL: tullyURL)
            
            let arryn = House(name: "Arryn",
                              sigil: arrynSigil,
                              words: "As High as Honor",
                              wikiURL: arrynURL)
            
            let baratheon = House(name: "Baratheon",
                                  sigil: baratheonSigil,
                                  words: "Ours Is the Fury",
                                  wikiURL: baratheonURL)
            
            let frey = House(name: "Frey",
                             sigil: freySigil,
                             words: "We Stand Together",
                             wikiURL: freyURL)
            
            let martell = House(name: "Martell",
                                sigil: martellSigil,
                                words: "Unbowed, Unbent, Unbroken",
                                wikiURL: martellURL)
            
            
            let eddard = Person(name: "Eddard", alias: "Ned", house: stark)
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa = Person(name: "Sansa", house: stark)
            let brandon = Person(name: "Branson", alias:"Bran", house: stark)
            let jon = Person(name: "Jon Snow",alias: "the White Wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let rickon = Person(name: "Rickon", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kinglsayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let tywin = Person(name: "Tywin", house: lannister)
            let dorna = Person(name: "Dorna", house: lannister)
            let cynda = Person(name: "Cynda", house: lannister)
            let lyman = Person(name: "Lyman", house: lannister)
            
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            let viserys = Person(name: "Viserys", house: targaryen)
            let aemon = Person(name: "Aemon", alias: "Maester Aemon", house: targaryen)
            let aerys = Person(name: "Aerys II", alias: "The Mad King", house: targaryen)
            
            let luthor = Person(name: "Luthor", house: tyrell)
            let olenna = Person(name: "Olenna", alias: "The Queen of Thorns", house: tyrell)
            let mace = Person(name: "Mace", house: tyrell)
            let margaery = Person(name: "Margaery", house: tyrell)
            let loras = Person(name: "Loras", alias: "Knight of the Flowers", house: tyrell)
            
            let balon = Person(name: "Balon", alias: "Lord of the Iron Islands", house: greyjoy)
            let rodrik = Person(name: "Rodrik", house: greyjoy)
            let maron = Person(name: "Maron", house: greyjoy)
            let yara = Person(name: "Yara", house: greyjoy)
            let theon = Person(name: "Theon", house: greyjoy)
            
            let minisa = Person(name: "Minisa", house: tully)
            let lysa = Person(name: "Lysa", house: tully)
            let catelyn = Person(name: "Catelyn", house: tully)
            let edmure = Person(name: "Edmure", house: tully)
            
            let jonArryn = Person(name: "Jon", house: arryn)
            let lysaArryn = Person(name: "Lysa", house: arryn)
            let robin = Person(name: "Robin", house: arryn)
            
            let walder = Person(name: "Walder", alias: "The Late Lord Frey", house: frey)
            let joyeuse = Person(name: "Joyeuse Erenford", house: frey)
            let kitty = Person(name: "Kitty", house: frey)
            
            let doran = Person(name: "Doran Nymeros", alias: "Prince of Dorne", house: martell)
            let elia = Person(name: "Elia Nymeros", house: martell)
            let oberyn = Person(name: "Oberyn Nymeros", alias: "the Red Viper", house: martell)
            
            let joffrey = Person(name: "Joffrey", house: baratheon)
            let robert = Person(name: "Robert", house: baratheon)
            let myrcella = Person(name: "Myrcella", house: baratheon)
            let tommen = Person(name: "Tommen", house: baratheon)
            let stannis = Person(name: "Stannis", house: baratheon)
            let renly = Person(name: "Renly", house: baratheon)
            
            
            // Añadir los personajes a las casas
            stark.add(persons: eddard, robb, sansa, brandon, jon, arya, rickon)
            lannister.add(persons: tyrion, jaime, cersei, tywin, dorna, cynda, lyman)
            targaryen.add(persons: dani, viserys, aemon, aerys)
            tyrell.add(persons: luthor, olenna, mace, margaery, loras)
            greyjoy.add(persons: balon, rodrik, maron, yara, theon)
            tully.add(persons: minisa, lysa, catelyn, edmure)
            arryn.add(persons: jonArryn, lysaArryn, robin)
            martell.add(persons: doran, elia, oberyn)
            frey.add(persons: walder, joyeuse, kitty)
            baratheon.add(persons: joffrey, robert, myrcella, tommen, stannis, renly)
            
            // Devolvemos las casas ordenadas
            return [stark, lannister, targaryen, tyrell, greyjoy, tully, arryn, baratheon, frey, martell].sorted()
            
            
        }
    }
    
    // Implemento la función de seasons filtradas
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        get {
            
            //Creo las variables para las casas y el array de personas
            let houses = self.houses
            var arrayOfPersons = [Person]()
            
            // itero por las casas para sacar los miembros y añadirlos al array de Personas
            for house in houses{
                for person in house.sortedMembers(){
                    arrayOfPersons.append(person)
                }
            }
            
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
            let season1 = Season(name: "Season 1", releaseDate: dateS1Ep1!, image: #imageLiteral(resourceName: "got_s1.jpg"))
            let season2 = Season(name: "Season 2", releaseDate: dateS2Ep1!, image: #imageLiteral(resourceName: "got_s2.jpg"))
            let season3 = Season(name: "Season 3", releaseDate: dateS3Ep1!, image: #imageLiteral(resourceName: "got_s3.jpg"))
            let season4 = Season(name: "Season 4", releaseDate: dateS4Ep1!, image: #imageLiteral(resourceName: "got_s4.jpg"))
            let season5 = Season(name: "Season 5", releaseDate: dateS5Ep1!, image: #imageLiteral(resourceName: "got_s5.jpg"))
            let season6 = Season(name: "Season 6", releaseDate: dateS6Ep1!, image: #imageLiteral(resourceName: "got_s6.jpg"))
            
            // Creo los Episodes (2 por Season)
            let ep1s1 = Episode(title: "1. Winter Is Coming", issueDate: dateS1Ep1!, season: season1, synopsis: "Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance. Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance.Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance.Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance.Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance.")
            let ep2s1 = Episode(title: "2. The Kingsroad", issueDate: dateS1Ep2!, season: season1, synopsis: "The Lannisters plot to ensure Bran's silence; Jon and Tyrion head to the Wall; Ned faces a family crisis en route to King's Landing.")
            
            let ep1s2 = Episode(title: "1. The North Remembers", issueDate: dateS2Ep1!, season: season2, synopsis: "Tyrion arrives to save Joffrey's crown; Daenerys searches for allies and water in the Red Waste; Jon Snow faces the wilderness beyond the Wall.")
            let ep2s2 = Episode(title: "2. The Night Lands", issueDate: dateS2Ep2!, season: season2, synopsis: "Arya shares a secret; a scout returns to Dany with disturbing news; Theon comes home to the Iron Islands; Tyrion administers justice; Jon witnesses a terrible crime.")
            
            let ep1s3 = Episode(title: "1. Valar Dohaeris", issueDate: dateS3Ep1!, season: season3, synopsis: "Jon is tested by the wildling king; Tyrion asks for his reward; Daenerys sails into Slaver's Bay.")
            let ep2s3 = Episode(title: "2. Dark Wings, Dark Words", issueDate: dateS3Ep2!, season: season3, synopsis: "Arya runs into the Brotherhood Without Banners; Jaime finds a way to pass the time.")
            
            let ep1s4 = Episode(title: "1. Two Swords", issueDate: dateS4Ep1!, season: season4, synopsis: "King's Landing prepares for a royal wedding; Dany finds the way to Meereen; the Night's Watch braces for a new threat.")
            let ep2s4 = Episode(title: "2. The Lion and the Rose", issueDate: dateS4Ep2!, season: season4, synopsis: "The Lannisters and their guests gather in King's Landing.")
            
            let ep1s5 = Episode(title: "1. The Wars to Come", issueDate: dateS5Ep1!, season: season5, synopsis: "Tyrion learns of a conspiracy; Jon is caught between two kings.")
            let ep2s5 = Episode(title: "2. The House of Black and White", issueDate: dateS5Ep2!, season: season5, synopsis: "Arya arrives in Braavos; Stannis tempts Jon.")
            
            let ep1s6 = Episode(title: "1. The Red Woman", issueDate: dateS6Ep1!, season: season6, synopsis: "At Castle Black, Thorne defends his treason while Edd and Davos defend themselves. Sansa and Theon race the cold and the hounds.")
            let ep2s6 = Episode(title: "2. Home", issueDate: dateS6Ep2!, season: season6, synopsis: "Bran trains with the Three-Eyed Raven. In King's Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night's Watch stands behind Thorne. Ramsay Bolton proposes a plan, and Balon Greyjoy entertains other proposals.")
            
            
            //var arrayOfEpisodes = [Episode]()
            
            // Añado las personas a los episodios
            ep1s1.add(arrayOfPersons: arrayOfPersons)
            ep1s2.add(arrayOfPersons: arrayOfPersons)
            ep1s3.add(arrayOfPersons: arrayOfPersons)
            ep1s4.add(arrayOfPersons: arrayOfPersons)
            ep1s5.add(arrayOfPersons: arrayOfPersons)
            ep1s6.add(arrayOfPersons: arrayOfPersons)
            ep2s1.add(arrayOfPersons: arrayOfPersons)
            ep2s2.add(arrayOfPersons: arrayOfPersons)
            ep2s3.add(arrayOfPersons: arrayOfPersons)
            ep2s4.add(arrayOfPersons: arrayOfPersons)
            ep2s5.add(arrayOfPersons: arrayOfPersons)
            ep2s6.add(arrayOfPersons: arrayOfPersons)
            
            //Añado los episodes a las Seasons
            season1.add(episodes: ep1s1, ep2s1)
            season2.add(episodes: ep1s2, ep2s2)
            season3.add(episodes: ep1s3, ep2s3)
            season4.add(episodes: ep1s4, ep2s4)
            season5.add(episodes: ep1s5, ep2s5)
            season6.add(episodes: ep1s6, ep2s6)
            
            //Devuelvo las Seasons
            return [season1,season2,season3,season4,season5,season6].sorted()
        }
    }

}

