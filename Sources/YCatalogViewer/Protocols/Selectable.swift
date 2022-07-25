//
//  Selectable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// protocol for selectable view
public protocol Selectable {
    ///  method to set isSelected for the given view
    /// - Parameter isSelected: Bool indicating if view is selected
    func setSelected(_ isSelected: Bool)
}
