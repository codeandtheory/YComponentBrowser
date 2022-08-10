//
//  GenericCollectionViewControllerTest.swift
//
//  Created by Y Media Labs on 09/08/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCollectionViewControllerTest: XCTestCase {
    var model: [CatalogDisplayView<CatalogDemoView>.Model] = []
    var navBarTitle: String!
    var collectionViewLayout: UICollectionViewLayout!
    
    override func setUp() {
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
        navBarTitle = "DemoTable"
        collectionViewLayout = UICollectionViewFlowLayout()
        super.setUp()
    }
    
    override func tearDown() {
        model = []
        navBarTitle = nil
        collectionViewLayout = nil
        
        super.tearDown()
    }
    
    lazy var collectionViewViewController = GenericCollectionViewController<CatalogDisplayView>(
        navigationTitle: navBarTitle,
        collectionViewLayout: collectionViewLayout,
        models: model
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
                numberOfItemsInSection: model.count
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
        let  indexPath = IndexPath(row: 0, section: 0)
        collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            didSelectItemAt: [0, 0]
        )
        collectionViewViewController.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        let isSelected = collectionViewViewController.collectionView(
            collectionViewViewController.collectionView,
            cellForItemAt: indexPath
        ).isSelected
        XCTAssertEqual(isSelected, true)
    }
}
