//
//  ColorViewTest.swift
//
//  Created by Y Media Labs on 01/08/22.
//

import XCTest
@testable import Y_Component_Browser

final class ColorViewTest: XCTestCase {
    func testInitWithCoder() throws {
        let sut = ColorView(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
    
    func testPopulatable() {
        let sut = makeSUT()

        XCTAssertNil(sut.backgroundColor)
        sut.populate(with: UIColor.red)
        XCTAssertEqual(sut.backgroundColor, .red)
    }
    
    func testReusable() {
        let sut = makeSUT()

        sut.populate(with: .red)
        XCTAssertNotNil(sut.backgroundColor)
        sut.prepareForReuse()
        XCTAssertNil(sut.backgroundColor)
    }
}

private extension ColorViewTest {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> ColorView {
        let sut = ColorView(frame: .zero)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
