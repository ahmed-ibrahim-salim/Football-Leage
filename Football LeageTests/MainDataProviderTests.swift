//
//  MainDataProviderTests.swift
//  Football LeageTests
//
//  Created by Ahmed ibrahim on 29/08/2022.
//

import XCTest
@testable import Football_Leage

class MainDataProviderTests: XCTestCase {
    var sut: MainDataProvider!
    var teamHelper: TeamDataHelper!
    var mockTableView: MockTableView!
    var playerHelper: PlayerDataHelper!
    
    override func setUpWithError() throws {
        sut = MainDataProvider()
        teamHelper = TeamDataHelper()
        playerHelper = PlayerDataHelper()
        
        sut.playerBridge = PlayerBridge(playerDataHelper: playerHelper)
        
        sut.teamBridge = TeamBridge(teamDataHelper: teamHelper)
        
        mockTableView = MockTableView()
        mockTableView.dataSource = sut
    }
    
    override func tearDownWithError() throws {
    }
    func test_NumberOfSections_IsTwo(){
        
        let tableView = UITableView()
        tableView.dataSource = sut
        XCTAssertEqual(tableView.numberOfSections, 2)
    }
    func test_NumberOfRows_Section1_EqualsNumberOfTeams()throws{
        var team1 = Team(nickName: "man united")
        var team2 = Team(nickName: "Liverpool")
        
        _ = try sut.teamBridge?.save(team: &team1)
        XCTAssertEqual(1, mockTableView.numberOfRows(inSection: 0))
        
        _ = try sut.teamBridge?.save(team: &team2)
        mockTableView.reloadData()
        XCTAssertEqual(2, mockTableView.numberOfRows(inSection: 0))
        
    }
    func test_NumberOfRows_InSectionTwo_NumberOfPlayers()throws{
        
        var player1 = Player(firstName: "ronaldo", lastName: "rooney")
        var player2 = Player(firstName: "ronax", lastName: "rone")
        _ = try self.sut.playerBridge?.save(player: &player1)
        XCTAssertEqual(1, mockTableView.numberOfRows(inSection: 1))
        _ = try self.sut.playerBridge?.save(player: &player2)
        
        mockTableView.reloadData()
        
        XCTAssertEqual(2, mockTableView.numberOfRows(inSection: 1))
        
    }
    func test_CellForRow_ReturnsDataRowCell()throws{
        var player = Player(firstName: "loca", lastName: "mod")
        mockTableView.register(DataRowCell.self, forCellReuseIdentifier: "DataRowCell")
        
        _ = try sut.playerBridge?.save(player: &player)
        mockTableView.reloadData()
        
        XCTAssertTrue(mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) is DataRowCell)
        
    }
    func test_DequeueResuableCell_GotDequeued()throws{
        var player = Player(firstName: "loca", lastName: "mod")
        mockTableView.register(DataRowCell.self, forCellReuseIdentifier: "DataRowCell")
        _ = try sut.playerBridge?.save(player: &player)
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) is DataRowCell
        
        XCTAssertTrue(mockTableView.cellDequeued)
    }
    func test_CellForRow_CallsConfigCellFoPlayers() throws {
        var player = Player(firstName: "abo", lastName: "Treka")
        mockTableView.register(MockDataRowCell.self, forCellReuseIdentifier: "DataRowCell")
        
        _ = try sut.playerBridge?.save(player: &player)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockDataRowCell
        
        XCTAssertEqual(cell.catchedTitle, "\(player.firstName) \(player.lastName)")
    }
    func test_CellForRow_For2Sections_CallsConfigCellForTeams() throws {
        mockTableView = MockTableView(
            frame: CGRect(x: 0, y: 0, width: 320, height: 480),
            style: .plain)
        
        mockTableView.dataSource = sut
        var team = Team(nickName: "abc")
        var player = Player(firstName: "name", lastName: "last")
        
        mockTableView.register(MockDataRowCell.self, forCellReuseIdentifier: "DataRowCell")
        
        _ = try sut.teamBridge?.save(team: &team)
        _ = try sut.playerBridge?.save(player: &player)

        mockTableView.reloadData()
        
        let teamCell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        as! MockDataRowCell
        let playerCell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1))
        as! MockDataRowCell
        
        XCTAssertEqual("\(player.firstName) \(player.lastName)", playerCell.catchedTitle)
        
        XCTAssertEqual(team.nickName, teamCell.catchedTitle)
       
    }
}

extension MainDataProviderTests{
    
    class MockTableView: UITableView{
        var cellDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
            
            cellDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier)
        }
    }
    
    class MockDataRowCell: DataRowCell{
        var calledConfigCell = false
        var catchedTitle: String?
        
        override func configCell(title: String){
            calledConfigCell = true
            catchedTitle = title
        }
    }
}
