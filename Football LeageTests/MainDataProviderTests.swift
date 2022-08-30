//
//  MainDataProviderTests.swift
//  Football LeageTests
//
//  Created by Ahmed ibrahim on 29/08/2022.
//

import XCTest
@testable import Football_Leage

class MainDataProviderTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    func test_NumberOfSections_IsTwo(){
        let sut = MainDataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut
        XCTAssertEqual(tableView.numberOfSections, 2)
    }
    func test_NumberOfRows_Section1_(){}
}
