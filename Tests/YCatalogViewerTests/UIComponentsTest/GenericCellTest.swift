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
        let model = ModelForDemoView()
        cell.populate(with: model)
        XCTAssertEqual(cell.displayedView.backgroundColor, .red)
    }
    
    func testGenericTableViewCellForReusable() throws {
        cell.prepareForReuse()
        XCTAssertEqual(cell.displayedView.backgroundColor, .clear)
    }
    
    func testGenericTableViewCellForNSCoder() throws {
        let secondcell = GenericTableViewCell<DemoView>(coder: NSCoder())
        XCTAssertNil(secondcell)
    }
}

class DemoView: UIView, Reusable, Identifiable, Populatable {
    typealias Model = ModelForDemoView
    
    func prepareForReuse() {
        self.backgroundColor = .clear
    }
    func populate(with model: Model) {
        self.backgroundColor = model.backgroundColor
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

struct ModelForDemoView {
    var backgroundColor: UIColor = .red
}
