//
//  CatalogDisplayViewTest.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class CatalogDisplayViewTest: XCTestCase {
    func testPopulatable() {
        let sut = makeSUT()
        let catalogDemoModel = CatalogDemoModel()
        let model = CatalogDisplayView<CatalogDemoView>.Model(
            title: nil,
            detail: nil,
            displayViewAxis: .vertical,
            displayViewModel: catalogDemoModel
        )

        XCTAssertFalse(sut.displayView.isPopulated)
        sut.populate(with: model)
        XCTAssertTrue(sut.displayView.isPopulated)
    }
    
    func testReusable() {
        let sut = makeSUT()

        XCTAssertFalse(sut.displayView.isPrepared)
        sut.prepareForReuse()
        XCTAssertTrue(sut.displayView.isPrepared)
    }
    
    func testHighlightable() {
        let sut = makeSUT()

        XCTAssertNil(sut.displayView.isHighlighted)
        sut.setHighlighted(true)
        XCTAssertEqual(sut.displayView.isHighlighted, true)
        sut.setHighlighted(false)
        XCTAssertEqual(sut.displayView.isHighlighted, false)
    }
    
    func testSelectable() {
        let sut = makeSUT()

        XCTAssertNil(sut.displayView.isSelected)
        sut.setSelected(true)
        XCTAssertEqual(sut.displayView.isSelected, true)
        sut.setSelected(false)
        XCTAssertEqual(sut.displayView.isSelected, false)
    }
    
    func testInitWithCoder() throws {
        let sut = CatalogDisplayView<CatalogDemoView>(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension CatalogDisplayViewTest {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CatalogDisplayView<CatalogDemoView> {
        let sut = CatalogDisplayView<CatalogDemoView>()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}

// MARK: - CatalogDemoView

final class CatalogDemoView: UIView {
    typealias Model = CatalogDemoModel
    
    var isPrepared = false
    var isPopulated = false
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

// MARK: - CatalogDemoModel

struct CatalogDemoModel { }
