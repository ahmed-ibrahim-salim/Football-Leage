//
//  MainViewControllerTests.swift
//  Football LeageTests
//
//  Created by Ahmad ibrahim on 29/08/2022.
//

import XCTest
@testable import Football_Leage

class MainViewControllerTests: XCTestCase {
    var sut: MainViewController!
    var tableView: UITableView!
    var mainDataProvider: MainDataProvider!
    
    override func setUpWithError() throws {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController
        sut.loadViewIfNeeded()

        tableView = sut.mainTableView

        mainDataProvider = MainDataProvider()
        tableView.dataSource = mainDataProvider
        tableView.delegate = mainDataProvider

    }

    override func tearDownWithError() throws {}
    
    func test_ViewControllerHasTableview_HasTableView(){
        XCTAssertNotNil(sut.mainTableView)
    }
    func test_CheckTableDataSource_SetsTableViewDataSource(){

        XCTAssertTrue(sut.mainTableView.dataSource is MainDataProvider)

    }
    func test_CheckTableDelegete_SetsTableViewDelegete(){
        
        XCTAssertTrue(sut.mainTableView.delegate is MainDataProvider)
    }
    func test_LoadingView_DataSourceEqualDelegate() {
        XCTAssertEqual(sut.mainTableView.dataSource as? MainDataProvider,
                       sut.mainTableView.delegate as? MainDataProvider)
    }
    func test_AddTeamBtn_NotNil(){
        XCTAssertNotNil(sut.addTeamBtn.isDescendant(of: sut.view))
    }
    func test_AddTeamBtnTitle_IsAddTeam(){
        sut.addTeamBtn.setTitle("Add Team", for: .normal)
        XCTAssertEqual(sut.addTeamBtn.title(for: .normal), "Add Team")
    }
    func test_AddTeamBtn_AddsTeamToTableView(){
        
    }
    func test_AddPlayerBtn_NotNil(){
        XCTAssertNotNil(sut.addPlayerBtn.isDescendant(of: sut.view))
    }
    func test_AddplayerBtnTitle_IsAddPlayer(){
        sut.addPlayerBtn.setTitle("Add Player", for: .normal)
        XCTAssertEqual(sut.addPlayerBtn.title(for: .normal), "Add Player")
    }

}
