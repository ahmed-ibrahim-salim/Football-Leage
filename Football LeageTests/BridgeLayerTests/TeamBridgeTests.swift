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
    var mockTeamDataHelper: MockTeamDataHelper!
    
    override func setUpWithError() throws {
        mockTeamDataHelper = MockTeamDataHelper()
        sut = TeamBridge(teamDataHelper: mockTeamDataHelper)
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
    func test_Save_CallsInsert()throws{
        var team = Team(nickName: "Man United")
        _ = try sut.save(team: &team)
        XCTAssertTrue(mockTeamDataHelper.calledInsert)
        
    }
    func test_SaveTwoSimilarTeamsToDatabase_ThrowsError()throws{
        var team1 = Team(nickName: "Man United")
        var team2 = Team(nickName: "Man United")
        
        _ = try sut.save(team: &team1)
        
        XCTAssertThrowsError(try sut.save(team: &team2))
    }
    func test_Delete_DeleteNonExistedTeam_ThrowsError(){
        let team1 = Team(nickName: "Man United")
        
        XCTAssertThrowsError(try sut.delete(team: team1))
    }
    func test_Delete_CallsDelete()throws{
        var team1 = Team(nickName: "Man United")
        
        _ = try sut.save(team: &team1)
        try sut.delete(team: team1)
        XCTAssertTrue(mockTeamDataHelper.calledDelete)
        
    }
    func test_Retrieve_RetrieveNonExistedTeam_ThrowsError(){
        let team1 = Team(nickName: "Man United")
        
        XCTAssertThrowsError(try sut.retrieve(team: team1))
    }
    func test_RetrieveTeamByIndex_ThrowsError()throws{
        XCTAssertThrowsError(try sut.retrieveByIndex(at: 0)) 
    }
    func test_RetrieveTeamByIndex_ReturnsTeam()throws{
        var team1 = Team(nickName: "Man United")
        
        _ = try sut.save(team: &team1)
        _ = try sut.retrieveByIndex(at: 0)
        XCTAssertTrue(mockTeamDataHelper.calledTeamAtIndex)
        
    }
    func test_Retrieve_RetrieveTeam_CallsTeamAt()throws{
        var team1 = Team(nickName: "Man United")
        
        _ = try sut.save(team: &team1)
        _ = try sut.retrieve(team: team1)
        XCTAssertTrue(mockTeamDataHelper.calledTeamAt)
        
    }
    func test_retrieveAllTeams_ReturnsAllTeams()throws{
        var team1 = Team(nickName: "Man United")
        var team2 = Team(nickName: "LiverPool")
        
        _ = try sut.save(team: &team1)
        _ = try sut.save(team: &team2)
        XCTAssertEqual(sut.teamsCount, 2)
        
    }
}

extension TeamBridgeTests{
    
    class MockTeamDataHelper: TeamDataHelper{
        var calledInsert: Bool = false
        var calledDelete: Bool = false
        var calledTeamAt: Bool = false
        var calledTeamAtIndex: Bool = false
        
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
        override func teamAtIndex(at index: Int) throws -> TeamData {
            calledTeamAtIndex = true
            return try super.teamAtIndex(at: index)
        }
    }
}
