//
//  PlayerDataTests.swift
//  Football LeageTests
//
//  Created by Ahmad medo on 26/08/2022.
//

import XCTest
@testable import Football_Leage

class PlayerDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_WhenGivenPlayerID_EqualPlayerId(){
        let player = PlayerData(playerId: 2, firstName: "Gerrad", lastName: "Pique", number: 22)
        
        XCTAssertEqual(player.playerId, 2)
    }
    func test_WhenGivenFirstNameAndLastName_EqualFirstNameAndLastName(){
        let player = PlayerData(playerId: 2, firstName: "Gerrad", lastName: "Pique", number: 22)
        
        XCTAssertEqual(player.firstName, "Gerrad")
        XCTAssertEqual(player.lastName, "Pique")
    }
    func test_2PlayersHaveSameId_IsEqual(){
        let player1 = PlayerData(playerId: 2, firstName: "Gerrad", lastName: "Pique", number: 22)
        
        let player2 = PlayerData(playerId: 2, firstName: "toni", lastName: "cruise", number: 22)

        XCTAssertEqual(player1, player2)
    }
    func test_2PlayersHaveFirstAndLastName_IsEqual(){
        let player1 = PlayerData(playerId: 1, firstName: "Gerrard", lastName: "Pique", number: 22)
        
        let player2 = PlayerData(playerId: 2, firstName: "Gerrard", lastName: "Pique", number: 22)

        XCTAssertEqual(player1, player2)
    }

}
