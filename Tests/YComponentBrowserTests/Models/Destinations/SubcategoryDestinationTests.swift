//
//  SubcategoryDestinationTests.swift
//
//  Created by Panchami Shenoy on 06/10/22.
//

import XCTest
@testable import YComponentBrowser

final class SubcategoryDestinationTests: XCTestCase {
    var controller = UIViewController()
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
}
