//
//  HouseTests.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros

class HouseTests: XCTestCase {
    
    //
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "house_stark.png")
        lannisterImage = #imageLiteral(resourceName: "house_lannister.png")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", wikiURL: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // Lo primero es que exista esa casa
    func testHouseExistence(){
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!",wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "house_stark.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "house_lannister.png"), description: "Rampant Lion")
        XCTAssertNotNil(lannisterSigil)
        
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
    }
    
    // Equatable
    func testHouseEquality(){
        
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad (jinxed = gafao)
        let jinxedHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!",wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(starkHouse, jinxedHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    
    // Hashable
    func testHashable() {
        
        // Comprobar si dos objetos tienen el mismo hash
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    // Comparable
    func testHouseComparison() {
        
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
}



