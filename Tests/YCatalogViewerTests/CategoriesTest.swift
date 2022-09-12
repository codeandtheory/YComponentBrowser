//
//  CategoriesTest.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import XCTest
@testable import YCatalogViewer

final class CategoriesTest: XCTestCase {
    func testIconographyCategory() {
        let model = [
            CatalogDisplayView<IconographyView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: UIImage(systemName: "person.fill") ?? UIImage()
            )
        ]
        let category = IconographyCategory(name: "Icons", models: model)
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
    
    func testColorCategory() {
        let model = [
            CatalogDisplayView<ColorView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: UIColor.blue
            )
        ]
        let category = ColorCategory(name: "Colors", models: model)
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
    
    func testTypographyCategory() {
        let model = [
            CatalogDisplayView<TypographyView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: TypographyView.Model(font: .boldSystemFont(ofSize: 25))
            )
        ]
        let category = TypographyCategory(name: "Texts", models: model)
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
    
    func testComponentCategory() {
        let model = [
            CatalogDisplayView<CatalogDemoView>.Model(
                title: "title1",
                detail: "detail1",
                displayViewAxis: .horizontal,
                displayViewModel: CatalogDemoModel()
            )
        ]
        let category = ComponentCategory<CatalogDemoView>(name: "Catalog Component", models: model)
        XCTAssertEqual("Component Category", category.destination.navigationTitle)
    }
}
