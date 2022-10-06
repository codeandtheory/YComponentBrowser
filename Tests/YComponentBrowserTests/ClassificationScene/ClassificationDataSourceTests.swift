//
//  ClassificationDataSourceTests.swift
//
//  Created by Panchami Shenoy on 06/10/22.
//

import XCTest
@testable import YComponentBrowser

final class ClassificationDataSourceTests: XCTestCase {
    var controller = UIViewController()
    
    func testClassificationDataSource() {
        let tableview = UITableView()
        let classificationDataSource = ClassificationDataSource(
            navigationTitle: "title",
            classification: [
                Demo(
                    destination: Demodestination(
                        present: .detail,
                        title: "color",
                        controller: controller
                    )
                )
            ]
        )
        XCTAssertEqual(
            1,
            classificationDataSource.tableView(
                UITableView(),
                numberOfRowsInSection: classificationDataSource.categories.count
            )
        )
        
        tableview.register(
            ClassificationDataSource.cell,
            forCellReuseIdentifier: ClassificationDataSource.cellIdentifier
        )
        let tableCell = classificationDataSource.tableView(tableview, cellForRowAt: [0, 0])
        XCTAssertNotNil(tableCell)
    }
}
