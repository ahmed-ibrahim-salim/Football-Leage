//
//  PlayerTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 27/08/2022.
//

import XCTest
@testable import Football_Leage

class PlayerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_NewPlayer_CreatesNewPlayer(){
        let player = Player(firstName: "Ramond", lastName: "gel")
        
        XCTAssertEqual(player.firstName, "Ramond")
        
    }
}
