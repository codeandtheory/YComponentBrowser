//
//  IdentifiableProtocolTest.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import XCTest
@testable import YCatalogViewer

class IdentifiableProtocolTest: XCTestCase {
    func testForIdentifiableValues() throws {
        XCTAssertEqual(MockTestClass.identifier, "MockTestClass")
    }
}

class MockTestClass: Identifiable {
}
