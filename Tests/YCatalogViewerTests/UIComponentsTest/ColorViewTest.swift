//
//  ColorViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import YCatalogViewer

class ColorViewTest: XCTestCase {
    var colorView: ColorView?
    
    func testorNSCoder() {
        let colorView = ColorView(coder: NSCoder())
        XCTAssertNil(colorView)
    }
    
    override func setUp() {
        super.setUp()
        colorView = ColorView(frame: .init())
    }
    
    override func tearDown() {
        colorView = nil
        
        super.tearDown()
    }
    
    func testForPopulatable() {
        XCTAssertNil(colorView?.backgroundColor)
        colorView?.populate(with: UIColor.red)
        XCTAssertNotNil(colorView?.backgroundColor)
    }
    
    func testForReusable() {
        colorView?.populate(with: .red)
        XCTAssertNotNil(colorView?.backgroundColor)
        colorView?.prepareForReuse()
        XCTAssertNil(colorView?.backgroundColor)
    }
}
