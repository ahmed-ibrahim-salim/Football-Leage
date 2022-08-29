//
//  PlayerDataTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 27/08/2022.
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
    func test_GetPlayer_PlayerNotInPlayers_ThrowsError(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "jorden")
        
        XCTAssertThrowsError(try sut.player(player: player1))
        
    }
    func test_GetPlayer_ReturnsPlayer(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "jorden")
        do{
            let _ = try sut.insert(item: player1)
            let returnedPlayer = try sut.player(player: player1)
            XCTAssertEqual(player1, returnedPlayer)
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.searchError)
        }
    }
    
    func test_Insert_WhenInsertSamePlayerTwice_ThrowsError(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        let player2 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        do{
            let _ = try sut.insert(item: player1)
            let _ = try sut.insert(item: player2)
            
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.insertError)
        }
    }
    func test_Insert_InsertsPlayer(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
        do{
            let _ = try sut.insert(item: player1)
            let index = try sut.insert(item: player2)
            XCTAssertEqual(sut.players[index], player2)
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.insertError)
        }
    }
    func test_Delete_WhenPlayerNotInPlayers_ThrowsError(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        
        XCTAssertThrowsError(try sut.delete(item: player1))
    }
    func test_Delete_DeletesPlayer(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
        do{
            let _ = try sut.insert(item: player1)
            let _ = try sut.insert(item: player2)
            let deletedTeam = try sut.delete(item: player2)

            XCTAssertEqual(player2, deletedTeam)
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.deleteError)
        }
    }
    func test_NumOfPlayers_CountOfPlayers(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
        do{
            let _ = try sut.insert(item: player1)
            let _ = try sut.insert(item: player2)
            
            XCTAssertEqual(sut.numOfPlayers, 2)
        }catch{
            
        }
    }
    func test_FindAll_WhenNoPlayers_ReturnsNil(){
        let teams = sut.findAll()
        XCTAssertNil(teams)
    }
    func test_FindAll_ReturnsAllPlayers(){
        let player1 = PlayerData(playerId: 1, firstName: "micheal", lastName: "roman")
        let player2 = PlayerData(playerId: 2, firstName: "micheal", lastName: "jorden")
        do{
            let _ = try sut.insert(item: player1)
            let _ = try sut.insert(item: player2)

            guard let players = sut.findAll()else{fatalError()}

            XCTAssertEqual(player1, players[0])
            XCTAssertEqual(player2, players[1])
        }catch{
            
        }
    }
}
