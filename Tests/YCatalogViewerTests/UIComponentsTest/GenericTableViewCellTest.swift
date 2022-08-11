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
    
    func testPopulatable() {
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
        let secondCell = GenericTableViewCell<DemoView>(coder: NSCoder())
        XCTAssertNil(secondCell)
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

final class DemoView: UIView {
    typealias Model = DemoModel
    
    var isPrepared = false
    var isPopulated = false
    var isHighlighted: Bool?
    var isSelected: Bool?
}

extension DemoView: Reusable {
    func prepareForReuse() {
        isPrepared = true
    }
}

extension DemoView: Populatable {
    func populate(with model: Model) {
        isPopulated = true
    }
}

extension DemoView: Highlightable {
    func setHighlighted(_ isHighlighted: Bool) {
        self.isHighlighted = isHighlighted
    }
}

extension DemoView: Selectable {
    func setSelected(_ isSelected: Bool) {
        self.isSelected = isSelected
    }
}

struct DemoModel { }
