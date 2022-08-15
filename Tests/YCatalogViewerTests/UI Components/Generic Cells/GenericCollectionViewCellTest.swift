//
//  GenericCollectionViewCellTest.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionCellTest: XCTestCase {
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
        let sut = GenericCollectionViewCell<DemoView>(coder: try makeCoder(for: makeSUT()))
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
        sut.isSelected = true
        XCTAssertEqual(sut.displayedView.isSelected, true)
        sut.isSelected = false
        XCTAssertEqual(sut.displayedView.isSelected, false)
    }
}

private extension GenericCollectionCellTest {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> GenericCollectionViewCell<DemoView> {
        let sut = GenericCollectionViewCell<DemoView>()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
