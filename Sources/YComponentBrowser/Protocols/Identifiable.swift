//
//  Identifiable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents a way to identify an object
public protocol Identifiable {
    /// Unique identifier for the type of object
    static var identifier: String { get }
}

/// Default implementation that returns the object type as the identifier
public extension Identifiable {
    /// Unique identifier for the type of object
    static var identifier: String { return "\(self)" }
}
