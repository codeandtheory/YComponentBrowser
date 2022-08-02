//
//  Reusable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be Reused
public protocol Reusable {
    /// Used to perform clean up for reuse
    func prepareForReuse()
}
