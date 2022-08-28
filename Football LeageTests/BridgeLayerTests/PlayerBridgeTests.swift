//
//  PlayerBridgeTests.swift
//  Football LeageTests
//
//  Created by magdy khalifa on 28/08/2022.
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
    func test_ToPlayer_ReturnsPlayer(){
        let playerData = PlayerData(firstName: "Toni", lastName: "Kroos")
        
        let player = sut.toPlayer(playerData: playerData)
        
        XCTAssertEqual(playerData.firstName, player.firstName)
    }
    func test_Save_InsertSimilarPlayers_ThrowsError(){
        var player1 = Player(firstName: "Toni", lastName: "Kroos")
        var player2 = Player(firstName: "Toni", lastName: "Kroos")
        
        do{
            let _ = try sut.save(player: &player1)
        }catch{
            XCTAssertTrue(false)
        }
        
        XCTAssertThrowsError(try sut.save(player: &player2))
    }
    func test_Save_CallsInsertAt(){
        var player1 = Player(firstName: "Toni", lastName: "Kroos")
        do{
            let _ = try sut.save(player: &player1)
            XCTAssertTrue(stubPlayerDataHelper.calledInsert)
        }catch{
            XCTAssertTrue(false)
        }
    }
}

extension PlayerBridgeTests{
    class StubPlayerDataHelper: PlayerDataHelper{
        
        var calledInsert: Bool = false
        
        override func insert(item: PlayerDataHelper.T) throws -> Int {
            calledInsert = true
            return try super.insert(item: item)
        }
    }
    
}
