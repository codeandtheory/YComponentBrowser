//
//  ClassificationViewControllerTest.swift
//
//  Created by Y Media Labs on 09/09/22.
//

import XCTest
@testable import YCatalogViewer

final class ClassificationViewControllerTest: XCTestCase {
    func testInitWithCoder() {
        let tableviewVCC = ClassificationViewController<ClassificationDataSource>(coder: NSCoder())
        XCTAssertNil(tableviewVCC)
    }

    func testDidSelect() {
        let controller = UIViewController()

        let classificationDataSourceOne = ClassificationDataSource(navigationTitle: "title", classification:
                                                                    [
                                                                        Demo(
                                                                            destination: Demodestination(
                                                                                present: .detail,
                                                                                title: "color",
                                                                                controller: controller
                                                                            )
                                                                        )
                                                                    ])
        let classificationDataSourceTwo = ClassificationDataSource(navigationTitle: "title", classification:
                                                                    [
                                                                        Demo(
                                                                            destination: Demodestination(
                                                                                present: .modal,
                                                                                title: "color",
                                                                                controller: controller
                                                                            )
                                                                        )
                                                                    ])
        var isCellSelected: Bool = false
        let controllerOne = ClassificationViewController(datasource: classificationDataSourceOne)
        let  controllerTwo = ClassificationViewController(datasource: classificationDataSourceTwo)
        
        let indexPath = IndexPath(row: 0, section: 0)
        controllerOne.tableView(controllerOne.tableView, didSelectRowAt: indexPath)
        controllerOne.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        isCellSelected = ((controllerOne.tableView.cellForRow(at: indexPath)?.isSelected) != nil)
        XCTAssertEqual(isCellSelected, true)
        
        controllerTwo.tableView(controllerTwo.tableView, didSelectRowAt: indexPath)
        controllerTwo.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        isCellSelected = ((controllerTwo.tableView.cellForRow(at: indexPath)?.isSelected) != nil)
        XCTAssertEqual(isCellSelected, true)
}
}
