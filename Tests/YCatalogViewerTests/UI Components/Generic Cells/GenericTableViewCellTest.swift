//
//  GenericTableViewCellTest.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericTableViewCellTest: XCTestCase {
    func testPopulatable() {
        let sut = makeSUT()
        let model = DemoModel()

        XCTAssertFalse(sut.displayedView.isPopulated)
        sut.populate(with: model)
        XCTAssertTrue(sut.displayedView.isPopulated)
    }
    
    func testReusable() {
        let sut = makeSUT()

        XCTAssertFalse(sut.displayedView.isPrepared)
        sut.prepareForReuse()
        XCTAssertTrue(sut.displayedView.isPrepared)
    }
    
    func testInitWithCoder() throws {
        let sut = GenericTableViewCell<DemoView>(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
    
    func testHighlightable() {
        let sut = makeSUT()

        XCTAssertNil(sut.displayedView.isHighlighted)
        sut.isHighlighted = true
        XCTAssertEqual(sut.displayedView.isHighlighted, true)
        sut.isHighlighted = false
        XCTAssertEqual(sut.displayedView.isHighlighted, false)
    }
    
    func testSelectable() {
        let sut = makeSUT()

        XCTAssertNil(sut.displayedView.isSelected)
        sut.isSelected = false
        XCTAssertEqual(sut.displayedView.isSelected, false)
        sut.isSelected = true
        XCTAssertEqual(sut.displayedView.isSelected, true)
    }
}

private extension GenericTableViewCellTest {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> GenericTableViewCell<DemoView> {
        let sut = GenericTableViewCell<DemoView>()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}

// MARK: - DemoView

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

// MARK: - DemoModel

struct DemoModel { }
