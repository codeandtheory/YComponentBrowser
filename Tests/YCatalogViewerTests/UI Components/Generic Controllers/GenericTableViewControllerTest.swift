//
//  GenericTableViewControllerTest.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewControllerTest: XCTestCase {
    var model: [CatalogDisplayView<CatalogDemoView>.Model]!
    var tableVC: GenericTableViewController<CatalogDisplayView<CatalogDemoView>>!

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

        tableVC = GenericTableViewController<CatalogDisplayView<CatalogDemoView>>(
            navigationTitle: "DemoTable",
            models: model
        )
    }
    
    override func tearDown() {
        model = nil
        tableVC = nil
        
        super.tearDown()
    }
    
    func testInitWithCoder() {
        let tableviewVCC = GenericTableViewController<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(tableviewVCC)
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(2, tableVC.tableView(tableVC.tableView, numberOfRowsInSection: model.count))
    }
    
    func testCellForRowAt() {
        let tableCell = tableVC.tableView(tableVC.tableView, cellForRowAt: [0, 0])
        XCTAssertNotNil(tableCell)
    }
    
    func testDidSelect() {
        let indexPath = IndexPath(row: 0, section: 0)
        tableVC.tableView(tableVC.tableView, didSelectRowAt: indexPath)
        tableVC.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        let isSelected = tableVC.tableView.cellForRow(at: indexPath)?.isSelected
        XCTAssertEqual(isSelected, true)
    }
}
