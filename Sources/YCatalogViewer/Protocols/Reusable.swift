//
//  Reusable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// protocol for reusable view
public protocol Reusable {
    /// method to perform clean up for reuse
    func prepareForReuse()
}
