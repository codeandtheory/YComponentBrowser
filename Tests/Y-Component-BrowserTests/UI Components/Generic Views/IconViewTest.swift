//
//  IconViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import Y_Component_Browser

final class IconViewTest: XCTestCase {
    func testInitWithCoder() throws {
        let sut = IconView(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
    
    func testPopulatable() {
        let sut = makeSUT()

        XCTAssertNil(sut.image)
        sut.populate(with: UIImage(systemName: "person.fill") ?? UIImage())
        XCTAssertNotNil(sut.image)
    }
    
    func testReusable() {
        let sut = makeSUT()

        sut.populate(with: UIImage(systemName: "person.fill") ?? UIImage())
        XCTAssertNotNil(sut.image)
        sut.prepareForReuse()
        XCTAssertNil(sut.image)
    }
}

private extension IconViewTest {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> IconView {
        let sut = IconView(frame: .zero)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
