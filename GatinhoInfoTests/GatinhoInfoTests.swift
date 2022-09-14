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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNumeroDeItensDaTableView() {
        let viewModel: FindBreeds = MockViewModel()
        let tableViewController = TableViewController(viewModel: viewModel)
        tableViewController.viewDidLoad()
        tableViewController.tableView.reloadData()
        
        XCTAssertEqual(viewModel.itemCount, 3)
        XCTAssertEqual(tableViewController.tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTituloDaPrimeiraCelulaEstaCorreto(){
        let viewModel: FindBreeds = MockViewModel()
        let tableViewController = TableViewController(viewModel: viewModel)
        tableViewController.viewDidLoad()
        tableViewController.tableView.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableViewController.tableView(tableViewController.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell.textLabel?.text, "cat 1")
    }
    
}
