//
//  Highlightable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be highlighted
public protocol Highlightable {
    ///  method to set highlighted for the given UI component
    /// - Parameter isHighlighted: bool indicating if UI component is highlighted
    func setHighlighted(_ isHighlighted: Bool)
}
