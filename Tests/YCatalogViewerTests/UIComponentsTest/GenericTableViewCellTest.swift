//
//  GenericTableViewCellTest.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewCellTest: XCTestCase {
    var cell: GenericTableViewCell<DemoView>?
    override func setUp() {
        super.setUp()
        
        cell = GenericTableViewCell<DemoView>()
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
        let secondcell = GenericTableViewCell<DemoView>(coder: NSCoder())
        XCTAssertNil(secondcell)
    }
    
    func testHighlightable() {
        XCTAssertNil(cell?.displayedView.isHighlighted)
        cell?.setHighlighted(true, animated: false)
        XCTAssertEqual(true, cell?.displayedView.isHighlighted)
    }
    
    func testSelectable() {
        XCTAssertNil(cell?.displayedView.isSelected)
        cell?.setSelected(true, animated: false)
        XCTAssertEqual(true, cell?.displayedView.isSelected)
    }
}

final class DemoView: UIView, Reusable, Populatable, Highlightable, Selectable {
    typealias Model = DemoModel
    
    var isPrepared = false
    var isPopulated = false
    var isHighlighted: Bool?
    var isSelected: Bool?
    
    func prepareForReuse() {
        isPrepared = true
    }
    
    func populate(with model: Model) {
        isPopulated = true
    }
    
    func setHighlighted(_ isHighlighted: Bool) {
        self.isHighlighted = isHighlighted
    }
    
    func setSelected(_ isSelected: Bool) {
        self.isSelected = isSelected
    }
}

struct DemoModel { }
