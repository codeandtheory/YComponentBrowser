//
//  Highlightable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be highlighted
public protocol Highlightable {
    /// Highlights the UI component
    /// - Parameter isHighlighted: whether the UI component is highlighted
    func setHighlighted(_ isHighlighted: Bool)
}
