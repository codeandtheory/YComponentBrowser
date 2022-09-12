//
//  CatalogFactoryTest.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import XCTest
@testable import YCatalogViewer
final class CatalogFactoryTest: XCTestCase {
    func testCreateCatalogViewer() {
        let catalogViewer = CatalogFactory.createCatalogViewer(
            with:
                [
                    Demo(
                        destination: Demodestination(
                            present: .detail,
                            title: "color",
                            controller: UIViewController()
                        )
                    )
                ],
            navigationTitle: "CatalogViewer",
            embedInNavigationController: true
        )
        XCTAssertNotNil(catalogViewer)
        
        let catalogViewerTwo = CatalogFactory.createCatalogViewer(
            with:
                [
                    Demo(
                        destination: Demodestination(
                            present: .detail,
                            title: "color",
                            controller: UIViewController()
                        )
                    )
                ],
            navigationTitle: "CatalogViewer",
            embedInNavigationController: false
        )
        XCTAssertNotNil(catalogViewerTwo)
    }
    
    func testCreateGenericDisplayViewController() {
        let model = [
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
        
        let generictableview = CatalogFactory.createGenericDisplayViewController(
            viewType: CatalogDisplayView<CatalogDemoView>.self,
            models: model
        )
        XCTAssertNotNil(generictableview)
        
        let genericCollectionView = CatalogFactory.createGenericDisplayViewController(
            viewType: CatalogDisplayView<CatalogDemoView>.self,
            models: model,
            display: .collection(UICollectionViewFlowLayout()),
            navigationTitle: "CollectionViewController"
        )
        XCTAssertNotNil(genericCollectionView)
    }
}
