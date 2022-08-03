//
//  TypographyViewTest.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class TypographyViewTest: XCTestCase {
    func testTypographyViewForNSCoder() throws {
        let typographyView = TypographyView(coder: NSCoder())
        XCTAssertNil(typographyView)
    }
}
