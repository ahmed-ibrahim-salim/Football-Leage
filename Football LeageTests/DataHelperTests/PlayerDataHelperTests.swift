//
//  PlayerDataTests.swift
//  Football LeageTests
//
//  Created by Ahmad medo on 27/08/2022.
//

import XCTest
@testable import Football_Leage

class PlayerDataHelperTests: XCTestCase {
    var sut: PlayerDataHelper!
    
    override func setUpWithError() throws {
        sut = PlayerDataHelper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//    func test_GetPlayer_ReturnsPlayer(){
//        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "jorden")
//
//        let _ = sut.insert(item: player1)
//
//        let returnedPlayer = sut.player(at: 0)
//        
//        XCTAssertEqual(player1, returnedPlayer)
//    }
//    func test_Insert_InsertsPlayer(){
//        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
//        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
//
//        let _ = sut.insert(item: player1)
//
//        let inserted = sut.insert(item: player2)
//
//        XCTAssertTrue(inserted)
//    }
//    func test_Delete_DeletesPlayer(){
//        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
//        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
//        
//        let _ = sut.insert(item: player1)
//        let _ = sut.insert(item: player2)
//
//        let deletedTeam = sut.delete(item: player2, at: 1)
//
//        XCTAssertEqual(player2, deletedTeam)
//    }
//    func test_NumOfPlayers_CountOfPlayers(){
//        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
//        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
//        
//        let _ = sut.insert(item: player1)
//        let _ = sut.insert(item: player2)
//        
//        XCTAssertEqual(sut.numOfPlayers, 2)
//    }
//    func test_FindAll_ReturnsAllPlayers(){
//        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
//        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
//        
//        let _ = sut.insert(item: player1)
//        let _ = sut.insert(item: player2)
//
//        let players = sut.findAll()
//
//        XCTAssertEqual(players, sut.players)
//    }


}
