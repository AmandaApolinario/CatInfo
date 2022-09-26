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
        viewModel = nil
        tableViewController = nil
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNumeroDeItensDaTableViewEIgualAoDaViewModel() {
        XCTAssertEqual(viewModel.itemCount, 6)
        XCTAssertEqual(tableViewController.tableView.numberOfRows(inSection: 0), 6)
    }
    
    func testTituloDaPrimeiraCelulaEstaCorreto(){
        let indexPath = IndexPath(row: 0, section: 0)
      
        XCTAssertEqual(viewModel.itemForTableView(indexPath), "cat 1")
    }
    
    func testFetchBreedsRetornaTrue() {
        viewModel.fetchBreeds{success in
            XCTAssertTrue(success)
        }
    }
    
    func testVerificaRetornoDosItemsDoProtocol(){
        viewModel.fetchBreeds{success in
            self.tableViewController.tableView.reloadData()
        }
        let indexPath = IndexPath(row: 1, section: 0)
        
        XCTAssertEqual(viewModel.itemCount, 6)
        XCTAssertEqual(viewModel.itemSelected(0).name, "cat 1")
        XCTAssertEqual(viewModel.itemForTableView(indexPath), "cat 2")
        
    }

  func testVerificaSeAViewEGenerica(){
    viewModel.fetchBreeds{success in
      self.tableViewController.tableView.reloadData()
    }
    let indexPath = IndexPath(row: 4, section: 0)
    XCTAssertEqual(viewModel.itemForTableView(indexPath), "Golden Retriever")

    XCTAssertEqual(viewModel.itemSelected(5).name, "Chow Chow")
  }
    
}
