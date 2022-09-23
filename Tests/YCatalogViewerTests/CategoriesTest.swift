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
                model: UIImage(systemName: "person.fill") ?? UIImage()
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
                model: UIColor.blue
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
                model: TypographyView.Model(font: .boldSystemFont(ofSize: 25))
            )
        ]
        let category = FontCategory(name: "Texts", models: model)
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
    
    func testComponentCategory() {
        let model = [
            CatalogDisplayView<CatalogDemoView>.Model(
                title: "title1",
                detail: "detail1",
                model: CatalogDemoModel()
            )
        ]
        let category = ComponentCategory<CatalogDemoView>(name: "Catalog Component", models: model)
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
    
    func testCustomCategory() {
        let model = CatalogDemoModel()
        
        let category = CustomCategory<CatalogDemoView>(name: "custom category", models: [model])
        XCTAssertEqual(category.name, category.destination.navigationTitle)
    }
}
