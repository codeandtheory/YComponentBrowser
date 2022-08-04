//
//  TypographyViewTest.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class TypographyViewTest: XCTestCase {
    var typographyView: TypographyView!
    
    override func setUp() {
        super.setUp()
        typographyView = TypographyView(frame: .init())
    }
    
    override func tearDown() {
        typographyView = nil
        super.tearDown()
    }
    
    func testTypographyViewForNSCoder() throws {
        let typographyView = TypographyView(coder: NSCoder())
        XCTAssertNil(typographyView)
    }
    
    func testPopulate() throws {
        XCTAssertNotEqual(typographyView.font, .boldSystemFont(ofSize: 20))
        typographyView.populate(with: TypographyModel(font: .boldSystemFont(ofSize: 20)))
        XCTAssertEqual(typographyView.font, .boldSystemFont(ofSize: 20))
    }
    
    func testReuable() throws {
        typographyView.prepareForReuse()
        XCTAssertEqual(typographyView.font, UIFont.systemFont(ofSize: 17))
    }
}
