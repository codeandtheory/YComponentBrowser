//
//  ColorViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import YCatalogViewer

final class ColorViewTest: XCTestCase {
    var colorView: ColorView?
    
    override func setUp() {
        super.setUp()
        colorView = ColorView(frame: .init())
    }
    
    override func tearDown() {
        colorView = nil
        
        super.tearDown()
    }
    
    func testInitWithCoder() {
        let colorView = ColorView(coder: NSCoder())
        XCTAssertNil(colorView)
    }
    
    func testPopulatable() {
        XCTAssertNil(colorView?.backgroundColor)
        colorView?.populate(with: UIColor.red)
        XCTAssertEqual(colorView?.backgroundColor, .red)
    }
    
    func testReusable() {
        colorView?.populate(with: .red)
        XCTAssertNotNil(colorView?.backgroundColor)
        colorView?.prepareForReuse()
        XCTAssertNil(colorView?.backgroundColor)
    }
}
