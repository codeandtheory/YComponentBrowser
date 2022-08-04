//
//  GenericTableViewCellTest.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import XCTest
@testable import YCatalogViewer

final class GenericCellTest: XCTestCase {
    let button = DemoButton()
    func testGenericTableViewCellForPopulatble() throws {
        button.populate(with: ModelForButton(title: "Button2"))
        XCTAssertEqual(button.titleLabel?.text, "Button2")
    }
    
    func testGenericTableViewCellForReusable() throws {
        button.prepareForReuse()
        XCTAssertEqual(button.titleLabel?.text, nil)
    }
}

class DemoButton: UIButton, Reusable, Identifiable, Populatable {
    typealias Model = ModelForButton
    
    func prepareForReuse() {
        self.setTitle(nil, for: .normal)
    }
    func populate(with model: Model) {
        self.setTitle(model.title, for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ModelForButton {
    var title = "Button1"
}
