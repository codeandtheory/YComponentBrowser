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

/// default implementation that returns the object type as the identifier
public extension Identifiable {
    static var identifier: String { return "\(self)"}
}
