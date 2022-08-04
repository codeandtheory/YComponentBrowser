//
//  GenericCollectionViewCellTest.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionCellTest: XCTestCase {
    var cell: GenericCollectionViewCell<DemoView>?
    override func setUp() {
        super.setUp()
        
        cell = GenericCollectionViewCell<DemoView>()
    }
    
    override func tearDown() {
        cell = nil
        
        super.tearDown()
    }
    
    func testPopulatble() {
        XCTAssertEqual(cell?.displayedView.isPopulated, false)
        let model = DemoModel()
        cell?.populate(with: model)
        XCTAssertEqual(cell?.displayedView.isPopulated, true)
    }
    
    func testReusable() {
        XCTAssertEqual(cell?.displayedView.isPrepared, false)
        cell?.prepareForReuse()
        XCTAssertEqual(cell?.displayedView.isPrepared, true)
    }
    
    func testNSCoder() {
        let secondcell = GenericCollectionViewCell<DemoView>(coder: NSCoder())
        XCTAssertNil(secondcell)
    }
    
    func testHighlightable() {
        XCTAssertNil(cell?.displayedView.isHighlighted)
        cell?.isHighlighted = true
        XCTAssertEqual(true, cell?.displayedView.isHighlighted)
    }
    
    func testSelectable() {
        XCTAssertNil(cell?.displayedView.isSelected)
        cell?.isSelected = true
        XCTAssertEqual(true, cell?.displayedView.isSelected)
    }
}