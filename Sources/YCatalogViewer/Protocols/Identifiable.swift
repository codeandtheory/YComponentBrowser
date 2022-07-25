//
//  Identifiable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// protocol to set default id for the given view
public protocol Identifiable {
    static var identifier: String { get }
}

/// protocol to set default id for the given view
public extension Identifiable {
    static var identifier: String { return "\(self)"}
}
