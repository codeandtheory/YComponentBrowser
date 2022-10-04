//
//  IdentifiableProtocolTest.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import XCTest
@testable import YComponentBrowser

final class IdentifiableProtocolTest: XCTestCase {
    func testForIdentifiableValues() throws {
        XCTAssertEqual(MockTestClass.identifier, "MockTestClass")
    }
}

class MockTestClass: Identifiable {
}
