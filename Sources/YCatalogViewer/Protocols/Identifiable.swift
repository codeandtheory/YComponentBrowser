//
//  Identifiable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// represents a way to identify an object
public protocol Identifiable {
    static var identifier: String { get }
}

/// represents a way to identify an object
public extension Identifiable {
    static var identifier: String { return "\(self)"}
}
