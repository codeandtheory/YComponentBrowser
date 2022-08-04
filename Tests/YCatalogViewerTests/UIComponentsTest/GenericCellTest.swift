//
//  GenericTableViewCellTest.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCellTest: XCTestCase {
    var cell = GenericTableViewCell<DemoView>()
    func testGenericTableViewCellForPopulatble() throws {
        XCTAssertEqual(cell.displayedView.isPopulated, false)
        let model = DemoModel()
        cell.populate(with: model)
        XCTAssertEqual(cell.displayedView.isPopulated, true)
    }
    
    func testGenericTableViewCellForReusable() throws {
        XCTAssertEqual(cell.displayedView.isPrepared, false)
        cell.prepareForReuse()
        XCTAssertEqual(cell.displayedView.isPrepared, true)
    }
    
    func testGenericTableViewCellForNSCoder() throws {
        let secondcell = GenericTableViewCell<DemoView>(coder: NSCoder())
        XCTAssertNil(secondcell)
    }
}

final class DemoView: UIView, Reusable, Identifiable, Populatable {
    typealias Model = DemoModel

    var isPrepared = false
    var isPopulated = false

    func prepareForReuse() {
         isPrepared = true
     }

    func populate(with model: Model) {
         isPopulated = true
    }
}

struct DemoModel { }
