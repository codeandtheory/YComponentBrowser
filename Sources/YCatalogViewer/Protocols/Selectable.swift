//
//  Selectable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

@objc public protocol Selectable {
    @objc optional func setSelected(_ isSelected: Bool)
}
