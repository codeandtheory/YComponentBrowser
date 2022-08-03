//
//  IconographyViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import YCatalogViewer

final class IconographyViewTest: XCTestCase {
    var view: IconographyView?
    
    override func setUp() {
        super.setUp()
        
        view = IconographyView(frame: .init())
    }
    
    override func tearDown() {
        view = nil
        
        super.tearDown()
    }
    
    func testForNSCoder() throws {
        let iconView = IconographyView(coder: NSCoder())
        XCTAssertNil(iconView)
    }
    
    func testPopulatable() throws {
        XCTAssertNil(view?.image)
        view?.populate(with: UIImage(systemName: "person.fill") ?? UIImage())
        XCTAssertNotNil(view?.image)
    }
    
    func testPrepareForReusable() throws {
        view?.populate(with: UIImage(systemName: "person.fill") ?? UIImage())
        XCTAssertNotNil(view?.image)
        view?.prepareForReuse()
        XCTAssertNil(view?.image)
    }
}
