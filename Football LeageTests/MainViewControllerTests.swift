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
    
    override func setUpWithError() throws {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController
        
        sut.loadViewIfNeeded()
        
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
}
