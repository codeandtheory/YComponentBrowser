//
//  GenericCollectionViewControllerTest.swift
//
//  Created by Y Media Labs on 09/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionViewControllerTest: XCTestCase {
    func testInitWithCoder() throws {
        let sut = GenericCollectionViewController<CatalogDemoView>(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
    
    func testNumberOfItemsInSection() {
        let sut = makeSUT()
        XCTAssertEqual(
            sut.collectionView(sut.collectionView, numberOfItemsInSection: 0),
            2
        )
    }
    
    func testCellForItemAt() {
        let sut = makeSUT()
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: [0, 0])
        XCTAssertNotNil(cell)
    }
    
    func testDidSelect() {
        let sut = makeSUT()
        let  indexPath = IndexPath(row: 0, section: 0)
        sut.collectionView(sut.collectionView, didSelectItemAt: indexPath)
        sut.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        let isSelected = sut.collectionView(sut.collectionView, cellForItemAt: indexPath).isSelected
        XCTAssertTrue(isSelected)
    }
}

private extension GenericCollectionViewControllerTest {
    func makeSUT(
        file: StaticString = #filePath, line: UInt = #line
    ) -> GenericCollectionViewController<CatalogDisplayView<CatalogDemoView>> {
        let model = [
            CatalogDisplayView<CatalogDemoView>.Model(
                title: "title1",
                detail: "detail1",
                model: CatalogDemoModel()
            ), CatalogDisplayView<CatalogDemoView>.Model(
                title: "title2",
                detail: "detail2",
                model: CatalogDemoModel()
            )
        ]

        let sut = GenericCollectionViewController<CatalogDisplayView<CatalogDemoView>>(
            navigationTitle: "Demo Collection",
            collectionViewLayout: UICollectionViewFlowLayout(),
            models: model
        )

        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
