//
//  GenericCollectionViewControllerTest.swift
//
//  Created by Y Media Labs on 09/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionViewControllerTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
     var collectionViewViewController = GenericCollectionViewController<CatalogDisplayView>(
        navigationTitle: "DemoTable",
        collectionViewLayout: UICollectionViewFlowLayout(),
        models: [
            CatalogDisplayView<CatalogDemoView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: CatalogDemoModel()
            ), CatalogDisplayView<CatalogDemoView>.Model(
                title: "title2",
                detail: "detail2",
                displayViewAxis: .horizontal,
                displayViewModel: CatalogDemoModel()
            )
        ]
    )
    
    func testInitWithCoder() {
        let collectionViewVC = GenericCollectionViewController<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(collectionViewVC)
    }
    
    func testNumberOfItemsInSection() {
        XCTAssertEqual(
            2,
            collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            numberOfItemsInSection: collectionViewViewController.models.count
        )
        )
    }
    
    func testCellForItemAt() {
        let collectionViewCell = collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            cellForItemAt: [0, 0]
        )
        XCTAssertNotNil(collectionViewCell)
    }
    
    func testDidSelect() {
        collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            didSelectItemAt: [0, 0]
        )
        let isSelected = collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            cellForItemAt: [0, 0]
        ).isSelected
        XCTAssertEqual(isSelected, true)
    }
}
