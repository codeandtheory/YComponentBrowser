//
//  Selectable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be selected
public protocol Selectable {
    ///  used to set isSelected for the given UI component
    /// - Parameter isSelected: Bool indicating if UI component is selected
    func setSelected(_ isSelected: Bool)
}
