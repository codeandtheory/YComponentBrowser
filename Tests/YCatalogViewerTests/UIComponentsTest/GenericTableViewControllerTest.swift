//
//  GenericTableViewControllerTest.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewControllerTest: XCTestCase {
    var model: [CatalogDisplayView<CatalogDemoView>.Model]!
    override func setUp() {
        super.setUp()
        
        model = [
            CatalogDisplayView<CatalogDemoView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: CatalogDemoModel()
            ), CatalogDisplayView<CatalogDemoView>.Model(
                title: "title2",
                detail: "detail2",
                displayViewAxis: .horizontal,
                displayViewModel: CatalogDemoModel()
            )
        ]
    }
    
    override func tearDown() {
        model = nil
        
        super.tearDown()
    }
    
    lazy var tableViewVC = GenericTableViewController<CatalogDisplayView>(
        navigationTitle: "DemoTable",
        models: model
    )
    
    func testInitWithCoder() {
        let tableviewVCC = GenericTableViewController<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(tableviewVCC)
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(2, tableViewVC.tableView(tableViewVC.tableView, numberOfRowsInSection: model.count))
    }
    
    func testCellForRowAt() {
        let tablecell = tableViewVC.tableView(tableViewVC.tableView, cellForRowAt: [0, 0])
        XCTAssertNotNil(tablecell)
    }
    
    func testDidSelect() {
        let indexPath = IndexPath(row: 0, section: 0)
        tableViewVC.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        let isSelected = tableViewVC.tableView.cellForRow(at: indexPath)?.isSelected
        XCTAssertEqual(isSelected, true)
    }
}
