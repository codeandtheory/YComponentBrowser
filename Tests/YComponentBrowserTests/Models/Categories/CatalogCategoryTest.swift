//
// catalogCategoryTest.swift
//
// Created by Y Media Labs on 08/09/22.
//
import XCTest
@testable import YComponentBrowser

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
