//
//  SeasonTests.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 16/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros

class SeasonTests: XCTestCase {
    
    //Declaro las variables que utilizaré
    var season1 : Season!
    var season2 : Season!
    var ep1s1 : Episode!
    var ep2s1 : Episode!
    
    var ep1s2 : Episode!
    
    let formatter = DateFormatter()
    
    
    override func setUp() {
        super.setUp()
        
        //Me creo unas fecha de prueba
        formatter.dateFormat = "yyyy/MM/dd"
        let dateS1 = formatter.date(from: "2011/05/01")
        let dateS2 = formatter.date(from: "2012/04/01")
        
        // Me creo algunas Seasons
        season1 = Season(name: "S1", releaseDate: dateS1!, image: #imageLiteral(resourceName: "got_s1.jpg"))
        season2 = Season(name: "S2", releaseDate: dateS2!, image: #imageLiteral(resourceName: "got_s2.jpg"))
        
        // Me creo algunos Episodes
        ep1s1 = Episode(title: "Episode1 Season1", issueDate: dateS1!, season: season1)
        ep2s1 = Episode(title: "Episode2 Season1", issueDate: dateS1!, season: season1)
        ep1s2 = Episode(title: "Episode1 Season2", issueDate: dateS2!, season: season2)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test de que existan Seasons
    func testSeasonExistence(){
        
        XCTAssertNotNil(season1)
    }
    
    // Test Equatable
    func testSeasonEquality(){
        
        // Identidad
        XCTAssertEqual(season1, season1)
        
        // Igualdad
        formatter.dateFormat = "yyyy/MM/dd"
        let dateS1 = formatter.date(from: "2011/05/01")
        let season235 = Season(name: "S1", releaseDate: dateS1!, image: #imageLiteral(resourceName: "got_s1.jpg"))
        XCTAssertEqual(season1, season235)
        
        // Desigualdad
        XCTAssertNotEqual(season1, season2)
        
    }
    
    // Hashable
    func testSeasonHashable() {
        
        // Comprobar si dos objetos tienen el mismo hash
        XCTAssertNotNil(season1.hashValue)
    }
    
    // Comparable
    func testSeasonComparable() {
        
        // menor que
        XCTAssertLessThan(season1, season2)
        
        // mayor que
        XCTAssertGreaterThan(season2, season1)
    }
    
    // CustomStringConvertible
    func testSeasonStringConversion(){
        XCTAssertEqual(season1.description, "<Season: S1>")
        
    }

    // Test Añadir Episodios
    func testAddEpisodes(){
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episode: ep1s1)
        XCTAssertEqual(season1.count, 1)
        
        season1.add(episode: ep2s1)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: ep1s2)
        XCTAssertEqual(season1.count, 2)
        
    }
    
}
