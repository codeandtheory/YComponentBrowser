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
    
    func testCatalogDisplayViewForPopulatble() {
        XCTAssertEqual(view.displayView.isPopulated, false)
        let catalogDemoModel = CatalogDemoModel()
        let model = CatalogDisplayView<CatalogDemoView>.CatalogDisplayModel(
            title: nil,
            detail: nil,
            displayViewAxis: .vertical,
            displayViewModel: catalogDemoModel
        )
        view.populate(with: model)
        XCTAssertEqual(view.displayView.isPopulated, true)
    }
    
    func testCatalogDisplayViewForReusable() {
        XCTAssertEqual(view.displayView.isPrepared, false)
        view.prepareForReuse()
        XCTAssertEqual(view.displayView.isPrepared, true)
    }
    
    func testCatalogDisplayViewForHighlightable() {
        XCTAssertEqual(view.displayView.highlighted, false)
        view.setHighlighted(true)
        XCTAssertEqual(view.displayView.highlighted, true)
    }
    
    func testCatalogDisplayViewForSelectable() {
        XCTAssertEqual(view.displayView.selected, false)
        view.setSelected(true)
        XCTAssertEqual(view.displayView.selected, true)
    }
    
    func testCatalogDisplayViewForNSCoder() {
        let catalogView = CatalogDisplayView<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(catalogView)
    }
}

final class CatalogDemoView: UIView {
    typealias Model = CatalogDemoModel
    
    var isPrepared = false
    var isPopulated = false
    var highlighted = false
    var selected = false
}

extension CatalogDemoView: Selectable {
    func setSelected(_ isSelected: Bool) {
        selected = true
    }
}

extension CatalogDemoView: Highlightable {
    func setHighlighted(_ isHighlighted: Bool) {
        highlighted = true
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
