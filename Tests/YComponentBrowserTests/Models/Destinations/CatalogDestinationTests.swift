//
//  CatalogDestinationTests.swift
//
//  Created by Panchami Shenoy on 06/10/22.
//

import XCTest
@testable import YComponentBrowser

final class CatalogDestinationTests: XCTestCase {
    func testCatalogDestination() {
        let catalogDestination = CatalogDetailDestination<DemoView>(
            presentationStyle: .detail,
            navigationTitle: "title",
            models: [DemoModel()]
        )
        XCTAssertEqual(.detail, catalogDestination.presentationStyle)
        XCTAssertNotNil(catalogDestination.getDestinationController())
    }
}
