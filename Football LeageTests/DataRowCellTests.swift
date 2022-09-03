//
//  DataRowCellTests.swift
//  Football LeageTests
//
//  Created by Ahmad medo on 03/09/2022.
//

import XCTest
@testable import Football_Leage

class DataRowCellTests: XCTestCase {
    var fakeDataSource: FakeDataStore!
    var tableView: UITableView!
    var dataRowCell: DataRowCell!
    
    override func setUpWithError() throws {
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyB.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        viewC?.loadViewIfNeeded()
        
        tableView = viewC?.mainTableView
        
        fakeDataSource = FakeDataStore()
        tableView.dataSource = fakeDataSource
        tableView.register(UINib(nibName: "DataRowCell", bundle: nil), forCellReuseIdentifier: "DataRowCell")
        dataRowCell = tableView.dequeueReusableCell(withIdentifier: "DataRowCell",
            for: IndexPath(row: 0, section: 0)) as? DataRowCell
        
    }

    override func tearDownWithError() throws {
    }
    func test_HasTitleLabel(){

        XCTAssertTrue(dataRowCell.titleLbl.isDescendant(of: dataRowCell.contentView))
    }
    func test_ConfigCell_SetsTitle() {
        dataRowCell.configCell(title: "hello")
        XCTAssertEqual(dataRowCell.titleLbl.text, "hello")
    }
}

extension DataRowCellTests{
    class FakeDataStore: NSObject, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    }
}
