//
//  TeamBridgeTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 27/08/2022.
//

import XCTest
@testable import Football_Leage

class TeamBridgeTests: XCTestCase {
    var sut: TeamBridge!
    var stupTeamDataHelper: StupTeamDataHelper!
    
    override func setUpWithError() throws {
        stupTeamDataHelper = StupTeamDataHelper()
        sut = TeamBridge(teamDataHelper: stupTeamDataHelper)
    }

    override func tearDownWithError() throws {
    }
    
    func test_FromTeamToTeamDataModel_ReturnsTeamData(){
        let team = Team(nickName: "Man United")
        
        let teamData = sut.toTeamData(team: team)
        XCTAssertEqual(team.nickName, teamData.nickName)
    }
    func test_FromTeamDataToTeam_ReturnsTeam(){
        let teamData = TeamData(nickName: "Liverpool", teamId: 2)
        
        let team = sut.toTeam(teamData: teamData)
        
        XCTAssertEqual(team.nickName, teamData.nickName)
        
    }
    func test_Save_CallsInsert(){
        var team = Team(nickName: "Man United")
        do{
            let _ = try sut.save(team: &team)
            XCTAssertTrue(stupTeamDataHelper.calledInsert)
            
        }catch{
            XCTAssertTrue(false)
        }
    }
    func test_SaveTwoSimilarTeamsToDatabase_ThrowsError(){
        var team1 = Team(nickName: "Man United")
        var team2 = Team(nickName: "Man United")

        do{
            let _ = try sut.save(team: &team1)
        }catch{
            XCTAssertTrue(false)
        }
        
        XCTAssertThrowsError(try sut.save(team: &team2))
    }
    func test_Delete_DeleteNonExistedTeam_ThrowsError(){
        let team1 = Team(nickName: "Man United")

         XCTAssertThrowsError(try sut.delete(team: team1))
    }
    func test_Delete_CallsDelete(){
        var team1 = Team(nickName: "Man United")
        
        do{
            let _ = try sut.save(team: &team1)
            try sut.delete(team: team1)
            XCTAssertTrue(stupTeamDataHelper.calledDelete)
        }catch{
            XCTAssertTrue(false)
        }
    }
    func test_Retrieve_RetrieveNonExistedTeam_ThrowsError(){
        let team1 = Team(nickName: "Man United")

        XCTAssertThrowsError(try sut.retrieve(team: team1))
    }
    func test_Retrieve_RetrieveTeam_CallsTeamAt(){
        var team1 = Team(nickName: "Man United")

        do{
            let _ = try sut.save(team: &team1)
            let _ = try sut.retrieve(team: team1)
            XCTAssertTrue(stupTeamDataHelper.calledTeamAt)
        }catch{
            XCTAssertTrue(false)
        }
    }
}

extension TeamBridgeTests{
    
    class StupTeamDataHelper: TeamDataHelper{
        var calledInsert: Bool = false
        var calledDelete: Bool = false
        var calledTeamAt: Bool = false
        
        override func insert(item: TeamDataHelper.T) throws -> Int {
            calledInsert = true
            return try super.insert(item: item)
        }
        override func delete(item: TeamDataHelper.T) throws -> TeamDataHelper.T {
            
            calledDelete = true
            return try super.delete(item: item)
        }
        override func team(team: TeamData) throws -> TeamDataHelper.T {
            calledTeamAt = true
            return try super.team(team: team)
        }
    }
}

