//
//  TeamDataTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import XCTest
@testable import Football_Leage

class TeamDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_GivenTeamID_EqualTeamId(){ 
        let team = TeamData(nickName: "Man", teamId: 1)
        
        XCTAssertEqual(team.teamId, 1)
    }
    
    func test_WhenGivenNickName_EqualNickName(){
        let team = TeamData(nickName: "Man United", teamId: 1)
        
        XCTAssertEqual(team.nickName, "Man United")
    }
    func test_2PlayersHaveFirstAndLastName_IsEqual(){
        let team1 = TeamData(nickName: "Liverpool", teamId: 2)
        
        let team2 = TeamData(nickName: "Liverpool", teamId: 1)

        XCTAssertEqual(team1, team2)
    }

}
