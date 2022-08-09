//
//  GenericTableViewControllerTest.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewControllerTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    var model = [
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
    
    lazy var tableViewVC = GenericTableViewController<CatalogDisplayView>(
        navigationTitle: "DemoTable",
        models: model
    )
    
    func testInitWithCoder() {
        let tableviewVCC = GenericTableViewController<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(tableviewVCC)
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(2, tableViewVC.tableView(tableViewVC.tableView, numberOfRowsInSection: tableViewVC.models.count))
    }
    
    func testCellForRowAt() {
        let tablecell = tableViewVC.tableView(tableViewVC.tableView, cellForRowAt: [0, 0])
        XCTAssertNotNil(tablecell)
    }
    
    func testDidSelect() {
        tableViewVC.tableView(tableViewVC.tableView, didSelectRowAt: [0, 0])
        let isSelected = tableViewVC.tableView(tableViewVC.tableView, cellForRowAt: [0, 0]).isSelected
        XCTAssertEqual(isSelected, true)
    }
}
