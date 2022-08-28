//
//  TeamTests.swift
//  Football LeageTests
//
//  Created by Ahmad medo on 27/08/2022.
//

import XCTest
@testable import Football_Leage

class TeamTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_Team_CreatesNewTeam(){
        let team = Team(nickName: "Man united")
        
        XCTAssertEqual(team.nickName, "Man united")
    }

}
