//
//  TeamDataHelperTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import XCTest
@testable import Football_Leage

class TeamDataHelperTests: XCTestCase {
    var sut: TeamDataHelper!
    
    override func setUpWithError() throws {
        sut = TeamDataHelper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_Insert_WhenInsertSameTeamTwice_ThrowsError(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)

        let team2 = TeamData(nickName: "Barcelona", teamId: 1)
        
        do{
            let _ = try sut.insert(item: team1)
        }catch{
            
        }
        XCTAssertThrowsError(try sut.insert(item: team2)){
            error in
            XCTAssertEqual(error as! DataAccessError, DataAccessError.insertError)
        }
    }
//    func test_Insert_InsertsTeam(){
//        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
//        do{
//            _ = try sut.insert(item: team1)
//        }catch{}
//        
//        let team2 = TeamData(nickName: "RealMadrid", teamId: 1)
//
//        XCTAssertThrowsError(try sut.insert(item: team2)){ (error) in
//            XCTAssertEqual(error as! DataAccessError, DataAccessError.insertError )
//        }
//    }
    
    func test_GetTeam_WhenTeamIsNotInTeams_ThrowsError(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        
        XCTAssertThrowsError(try sut.team(team: team1)){
            error in
            XCTAssertEqual(error as! DataAccessError, DataAccessError.searchError)
        }
    }
    
    func test_GetTeam_ReturnsTeam(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        let team2 = TeamData(nickName: "Real Madrid", teamId: 2)
        
        do{
            let _ = try sut.insert(item: team1)
            let index2 = try sut.insert(item: team2)
            
            let returnedTeam = try sut.team(team: team2)
            XCTAssertEqual(sut.teams[index2],returnedTeam )
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.searchError)
        }
    }
    func test_Delete_WhenTeamIsNotInTeams_ThrowsError(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        
        XCTAssertThrowsError(try sut.delete(item: team1)){
            error in
            XCTAssertEqual(error as! DataAccessError, DataAccessError.deleteError)
        }
    }
    func test_Delete_DeletesTeam(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        let team2 = TeamData(nickName: "Real Madrid", teamId: 2)
        do{
            let _ = try sut.insert(item: team1)
            let _ = try sut.insert(item: team2)
            let deletedTeam = try sut.delete(item: team2)
            XCTAssertEqual(team2, deletedTeam)
        }catch(let error){
            XCTAssertEqual(error as! DataAccessError, DataAccessError.deleteError)
        }
        
    }
    func test_NumOfTeams_CountOfTeams(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        let team2 = TeamData(nickName: "Real Madrid", teamId: 2)
        do{
            let _ = try sut.insert(item: team1)
            let _ = try sut.insert(item: team2)
            XCTAssertEqual(sut.numOfTeams, 2)
        }catch{
            
        }
    }
    func test_FindAll_WhenNoTeams_ReturnsNil(){
        let teams = sut.findAll()
        XCTAssertNil(teams)
            
    }
    func test_FindAll_ReturnsAllTeams(){
        let team1 = TeamData(nickName: "Barcelona", teamId: 1)
        let team2 = TeamData(nickName: "Real Madrid", teamId: 2)
        do{
            let _ = try sut.insert(item: team1)
            let _ = try sut.insert(item: team2)
            guard let teams = sut.findAll()else{fatalError()}

            XCTAssertEqual(team1, teams[0])
            XCTAssertEqual(team2, teams[1])
        }catch{
            
        }
    }
}
