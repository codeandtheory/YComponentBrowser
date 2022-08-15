//
//  CatalogDisplayViewTest.swift
//
//  Created by Y Media Labd on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class CatalogDisplayViewTest: XCTestCase {
    var view: CatalogDisplayView<CatalogDemoView>!
    
    override func setUp() {
        super.setUp()
        
        view = CatalogDisplayView<CatalogDemoView>()
    }
    
    override func tearDown() {
        view = nil
        
        super.tearDown()
    }
    
    func testPopulatble() {
        XCTAssertNil(view.displayView.isPopulated)
        let catalogDemoModel = CatalogDemoModel()
        let model = CatalogDisplayView<CatalogDemoView>.Model(
            title: nil,
            detail: nil,
            displayViewAxis: .vertical,
            displayViewModel: catalogDemoModel
        )
        view.populate(with: model)
        XCTAssertEqual(view.displayView.isPopulated, true)
    }
    
    func testReusable() {
        XCTAssertNil(view.displayView.isPrepared)
        view.prepareForReuse()
        XCTAssertEqual(view.displayView.isPrepared, true)
    }
    
    func testHighlightable() {
        XCTAssertNil(view.displayView.isHighlighted)
        view.setHighlighted(true)
        XCTAssertEqual(view.displayView.isHighlighted, true)
    }
    
    func testSelectable() {
        XCTAssertNil(view.displayView.isSelected)
        view.setSelected(true)
        XCTAssertEqual(view.displayView.isSelected, true)
    }
    
    func testInitWithCoder() {
        let catalogView = CatalogDisplayView<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(catalogView)
    }
}

final class CatalogDemoView: UIView {
    typealias Model = CatalogDemoModel
    
    var isPrepared: Bool?
    var isPopulated: Bool?
    var isHighlighted: Bool?
    var isSelected: Bool?
}

extension CatalogDemoView: Selectable {
    func setSelected(_ isSelected: Bool) {
        self.isSelected = isSelected
    }
}

extension CatalogDemoView: Highlightable {
    func setHighlighted(_ isHighlighted: Bool) {
        self.isHighlighted = isHighlighted
    }
}

extension CatalogDemoView: Populatable {
    func populate(with model: Model) {
        isPopulated = true
    }
}

extension CatalogDemoView: Reusable {
    func prepareForReuse() {
        isPrepared = true
    }
}

struct CatalogDemoModel { }
