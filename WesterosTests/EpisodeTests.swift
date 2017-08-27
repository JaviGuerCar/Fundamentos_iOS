//
//  EpisodeTests.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros

class EpisodeTests: XCTestCase {
    
    //Declaro las variables que utilizaré
    var season1 : Season!
    var season2 : Season!
    var ep1s1 : Episode!
    var ep2s1 : Episode!
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
        ep2s1 = Episode(title: "Episode2 Season1", issueDate: dateS1!, season: season1)    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test que exista un Episodio
    func testEpisodeExistence() {
        
        XCTAssertNotNil(ep1s1)
    }
    
    // Test Equatable
    func testEpisodeEquality(){
        
        // Identidad
        XCTAssertEqual(ep1s1, ep1s1)
        
        // Igualdad
        formatter.dateFormat = "yyyy/MM/dd"
        let dateS1 = formatter.date(from: "2011/05/01")
        let ep3s1 = Season(name: "S1", releaseDate: dateS1!, image: #imageLiteral(resourceName: "got_s1.jpg"))
        XCTAssertEqual(season1, ep3s1)
        
        // Desigualdad
        XCTAssertNotEqual(ep1s1, ep2s1)
        
    }
    
    // Test Hashable
    func testEpisodeHashable(){
        
        XCTAssertNotNil(ep1s1.hashValue)
    }
    
    // Test Comparable
    func testEpisodeComparable(){
        // menor que
        XCTAssertLessThan(ep1s1, ep2s1)
        // mayor que
        XCTAssertGreaterThan(ep2s1, ep1s1)
    }
    
    // CustomStringConvertible
    func testEpisodeStringConversion(){
        XCTAssertEqual(ep1s1.description, "<Episode: Episode1 Season1>")
        
    }
}
