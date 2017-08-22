//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 11/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest

@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses : [House]!
    var localSeasons : [Season]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Testar la creación de un repositorio local
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    // Test para comprobar el funcionamiento básico de este Repositorio
    func testLocalRepositoryHousesCreation(){
        //let houses = Repository.local.houses
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    // Creacion de Repositorio de Seasons
    func testLocalRepositorySeasonsCreation(){
        //let houses = Repository.local.houses
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 6)
    }
    
    func testLocalRepositoryReturnsSortedArray(){
        
        XCTAssertEqual(localHouses, localHouses.sorted())
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        // El caso de que no haya
        let grijander = Repository.local.house(named: "Grijander")
        XCTAssertNil(grijander)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count==1})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFiltering(){
        let filtered = Repository.local.seasons(filteredBy: {$0.count==0})
        XCTAssertEqual(filtered.count, 0)
    }
    
}
