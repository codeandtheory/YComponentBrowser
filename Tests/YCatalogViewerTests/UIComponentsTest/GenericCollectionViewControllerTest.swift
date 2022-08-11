//
//  GenericCollectionViewControllerTest.swift
//
//  Created by Y Media Labs on 09/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionViewControllerTest: XCTestCase {
    var collectionViewController: GenericCollectionViewController<CatalogDisplayView<CatalogDemoView>>!
    var model: [CatalogDisplayView<CatalogDemoView>.Model]!
    
    override func setUp() {
        super.setUp()

        model = [
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

        collectionViewController = GenericCollectionViewController<CatalogDisplayView<CatalogDemoView>>(
            navigationTitle: "Demo Collection",
            collectionViewLayout: UICollectionViewFlowLayout(),
            models: model
        )
    }
    
    override func tearDown() {
        model = nil
        collectionViewController = nil
        
        super.tearDown()
    }

    func testInitWithCoder() {
        let collectionViewVC = GenericCollectionViewController<CatalogDemoView>(coder: NSCoder())
        XCTAssertNil(collectionViewVC)
    }
    
    func testNumberOfItemsInSection() {
        XCTAssertEqual(
            2,
            collectionViewController.collectionView(
                collectionViewController.collectionView,
                numberOfItemsInSection: model.count
            )
        )
    }
    
    func testCellForItemAt() {
        let collectionViewCell = collectionViewController.collectionView(
            collectionViewController.collectionView,
            cellForItemAt: [0, 0]
        )
        XCTAssertNotNil(collectionViewCell)
    }
    
    func testDidSelect() {
        let  indexPath = IndexPath(row: 0, section: 0)
        collectionViewController.collectionView(
            collectionViewController.collectionView,
            didSelectItemAt: indexPath
        )
        collectionViewController.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        let isSelected = collectionViewController.collectionView(
            collectionViewController.collectionView,
            cellForItemAt: indexPath
        ).isSelected
        XCTAssertEqual(isSelected, true)
    }
}
