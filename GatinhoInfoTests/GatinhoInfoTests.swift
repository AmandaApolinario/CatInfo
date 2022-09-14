//
//  GatinhoInfoTests.swift
//  GatinhoInfoTests
//
//  Created by Inpeaceapp on 06/09/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import XCTest
@testable import GatinhoInfo

class GatinhoInfoTests: XCTestCase {
    
    var viewModel: FindBreeds!
    var tableViewController: TableViewController!
    
    override func setUp() {
        super.setUp()
        viewModel = MockViewModel()
        tableViewController = TableViewController(viewModel: viewModel)
        tableViewController.viewDidLoad()
        tableViewController.tableView.reloadData()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNumeroDeItensDaTableView() {
        XCTAssertEqual(viewModel.itemCount, 3)
        XCTAssertEqual(tableViewController.tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTituloDaPrimeiraCelulaEstaCorreto(){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableViewController.tableView(tableViewController.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell.textLabel?.text, "cat 1")
    }
    
}
