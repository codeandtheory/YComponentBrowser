//
//  Selectable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be selected
public protocol Selectable {
    /// Selects the given UI component
    /// - Parameter isSelected: whether the UI component is selected
    func setSelected(_ isSelected: Bool)
}
