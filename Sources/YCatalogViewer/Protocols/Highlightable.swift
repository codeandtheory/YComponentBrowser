//
//  Highlightable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// protocol for highlightable view
public protocol Highlightable {
    ///  method to set highlighted for the given view
    /// - Parameter isHighlighted: bool indicating if view is highlighted
    func setHighlighted(_ isHighlighted: Bool)
}
