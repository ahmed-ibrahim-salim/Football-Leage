//
//  PlayerBridgeTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 28/08/2022.
//

import XCTest
@testable import Football_Leage

class PlayerBridgeTests: XCTestCase {
    var sut: PlayerBridge!
    var stubPlayerDataHelper: StubPlayerDataHelper!
    
    override func setUpWithError() throws {
        stubPlayerDataHelper = StubPlayerDataHelper()
        sut = PlayerBridge(playerDataHelper: stubPlayerDataHelper)
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_ToPlayerData_ReturnsPlayerData(){
        let player = Player(firstName: "Toni", lastName: "Kroos")
        
        let playerData = sut.toPlayerData(player: player)
        
        XCTAssertEqual(player.firstName, playerData.firstName)
    }
    func test_ToPlayer_ReturnsPlayer() {
        let playerData = PlayerData(firstName: "Toni", lastName: "Kroos")
        
        let player = sut.toPlayer(playerData: playerData)
        
        XCTAssertEqual(playerData.firstName, player.firstName)
    }
    func test_Save_InsertSimilarPlayers_ThrowsError()throws{
        var player1 = Player(firstName: "Toni", lastName: "Kroos")
        var player2 = Player(firstName: "Toni", lastName: "Kroos")
        
             _ = try sut.save(player: &player1)
        
        XCTAssertThrowsError(try sut.save(player: &player2))
    }
    func test_Save_CallsInsertAt()throws{
        var player1 = Player(firstName: "Toni", lastName: "Kroos")
             _ = try sut.save(player: &player1)
            XCTAssertTrue(stubPlayerDataHelper.calledInsert)

    }
    func test_Delete_DeleteNonExistedPlayer_ThrowsError(){
        let player = Player(firstName: "loka", lastName: "Modrich")
        
        XCTAssertThrowsError(try sut.delete(player: player))
    }
    func test_Delete_DeletesPlayer() throws {
        var player1 = Player(firstName: "Loca", lastName: "Modrich")
        var player2 = Player(firstName: "ronaldinho", lastName: "Ronaldo")
        
             _ = try sut.save(player: &player1)
             _ = try sut.save(player: &player2)

            try sut.delete(player: player2)
            XCTAssertTrue(stubPlayerDataHelper.calledDelete)

    }
    func test_Retrieve_RetrieveNonExistedPlayer_ThrowsError(){
        let player = Player(firstName: "Luca", lastName: "Modrich")
        
        XCTAssertThrowsError(try sut.retrieve(player: player))
    }
    func test_Retrive_RetrievesPlayer() throws{
        var player = Player(firstName: "Luca", lastName: "Modrich")

            try sut.save(player: &player)
             _ = try sut.retrieve(player: player)
            
            XCTAssertTrue(stubPlayerDataHelper.calledPlayer)

    }
    func test_countOfPlayers_returnsPlayersCount() throws {
        var player1 = Player(firstName: "Luca", lastName: "Modrich")
        var player2 = Player(firstName: "Lu", lastName: "Mod")
        
            _ = try sut.save(player: &player1)
            _ = try sut.save(player: &player2)
            XCTAssertEqual(sut.playersCount, 2)
    }
    func test_RetrievePlayerByIndex_ThrowsError(){
        
        XCTAssertThrowsError(try sut.retrieveByIndex(at: 0))
    }
    func test_RetrieveByIndex_ReturnsPlayer()throws{
        var player1 = Player(firstName: "first", lastName: "last")
        _ = try sut.save(player: &player1)
        
        _ = try sut.retrieveByIndex(at: 0)
        
        XCTAssertTrue(stubPlayerDataHelper.calledPlayerAtIndex)
        
    }
}

extension PlayerBridgeTests{
    class StubPlayerDataHelper: PlayerDataHelper{
        
        var calledInsert: Bool = false
        var calledDelete: Bool = false
        var calledPlayer: Bool = false
        var calledPlayerAtIndex: Bool = false
        
        override func insert(item: PlayerDataHelper.T) throws -> Int {
            calledInsert = true
            return try super.insert(item: item)
        }
        override func delete(item: PlayerDataHelper.T) throws -> PlayerDataHelper.T {
            calledDelete = true
            return try super.delete(item: item)
        }
        override func player(player: PlayerDataHelper.T) throws -> PlayerDataHelper.T {
            self.calledPlayer = true
            return try super.player(player: player)
        }
        override func playerAtIndex(at index: Int) throws -> PlayerData {
            calledPlayerAtIndex = true
            return try super.playerAtIndex(at: index)
        }
    }
    
}
