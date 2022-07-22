//
//  Identifiable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

public protocol Identifiable {
    static var identifier: String { get }
}

public extension Identifiable {
    static var identifier: String { return "\(self)"}
}
