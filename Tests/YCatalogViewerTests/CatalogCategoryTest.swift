//
// catalogCategoryTest.swift
//
// Created by Y Media Labs on 08/09/22.
//
import XCTest
@testable import YCatalogViewer
final class CatalogCategoryTest: XCTestCase {
    var controller = UIViewController()
    func testCatalogCategory() {
        let category = CatalogCategory(
            name: "category",
            subcategories:
                [
                    Demo(
                        destination: Demodestination(
                            present: .detail,
                            title: "color",
                            controller: controller
                        )
                    )
                ]
        )
        XCTAssertEqual("category", category.destination.navigationTitle)
        XCTAssertEqual(.detail, category.destination.presentationStyle)
    }
    
    func testSubcategoryDestination() {
        let subcategory = SubcategoryDetailDestination(
            presentationStyle: .detail,
            navigationTitle: "title",
            subcategories:
                [
                    Demo(
                        destination: Demodestination(
                            present: .detail,
                            title: "color",
                            controller: controller
                        )
                    )
                ]
        )
        XCTAssertEqual("title", subcategory.navigationTitle)
        XCTAssertEqual(.detail, subcategory.subcategories[0].presentationStyle)
        XCTAssertEqual(
            type(
                of: subcategory.getDestinationController()
            ) == ClassificationViewController<ClassificationDataSource>.self,
            true
        )
    }
    
    func testCatalogDestination() {
        let catalogDestination = CatalogDetailDestination<DemoView>(
            presentationStyle: .detail,
            navigationTitle: "title",
            models: [DemoModel()]
        )
        XCTAssertEqual(.detail, catalogDestination.presentationStyle)
        XCTAssertNotNil(catalogDestination.getDestinationController())
    }
    
    func testClassificationDataSource() {
        let tableview = UITableView()
        let classificationDataSource = ClassificationDataSource(navigationTitle: "title", classification:
                                                                    [
                                                                        Demo(
                                                                            destination: Demodestination(
                                                                                present: .detail,
                                                                                title: "color",
                                                                                controller: controller
                                                                            )
                                                                        )
                                                                    ])
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

class Demo: Classification {
    var name: String = ""
    var destination: Destination
    public init(destination: Destination) {
        self.destination = destination
    }
}

class Demodestination: Destination {
    func getDestinationController() -> UIViewController {
        return controller
    }
    
    var presentationStyle: Presentation
    var navigationTitle: String?
    var controller: UIViewController
    public init(present: Presentation, title: String, controller: UIViewController) {
        presentationStyle = present
        navigationTitle = title
        self.controller = controller
    }
}
