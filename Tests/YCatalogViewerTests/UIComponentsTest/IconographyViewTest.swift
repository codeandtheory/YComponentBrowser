//
//  IconographyViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import YCatalogViewer

final class IconographyViewTest: XCTestCase {
    func testIconographyViewForNSCoder() throws {
        let iconView = IconographyView(coder: NSCoder())
        XCTAssertNil(iconView)
    }
}
