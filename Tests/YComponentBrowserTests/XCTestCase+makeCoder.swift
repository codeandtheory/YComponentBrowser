//
//  XCTestCase+makeCoder.swift
//  YComponentBrowserTests
//
//  Created by Mark Pospesel on 8/15/22.
//  Copyright © 2022 Y Media Labs. All rights reserved.
//

import XCTest

extension XCTestCase {
    // Use this for testing initWithCoder
    func makeCoder(for object: Any) throws -> NSCoder {
        let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
        return try NSKeyedUnarchiver(forReadingFrom: data)
    }
}
