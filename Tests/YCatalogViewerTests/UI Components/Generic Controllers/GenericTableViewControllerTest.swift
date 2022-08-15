//
//  GenericTableViewControllerTest.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewControllerTest: XCTestCase {
    func testInitWithCoder() throws {
        let sut = GenericTableViewController<CatalogDemoView>(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
    
    func testNumberOfRowsInSection() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), 2)
    }
    
    func testCellForRowAt() {
        let sut = makeSUT()
        let cell = sut.tableView(sut.tableView, cellForRowAt: [0, 0])
        XCTAssertNotNil(cell)
    }
    
    func testDidSelect() {
        let sut = makeSUT()
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        sut.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        let isSelected = sut.tableView.cellForRow(at: indexPath)?.isSelected
        XCTAssertEqual(isSelected, true)
    }
}

private extension GenericTableViewControllerTest {
    func makeSUT(
        file: StaticString = #filePath, line: UInt = #line
    ) -> GenericTableViewController<CatalogDisplayView<CatalogDemoView>> {
        let model = [
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

        let sut = GenericTableViewController<CatalogDisplayView<CatalogDemoView>>(
            navigationTitle: "DemoTable",
            models: model
        )

        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
