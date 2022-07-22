//
//  Highlightable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

@objc public protocol Highlightable {
     @objc optional func setHighlighted(_ isHighlighted: Bool)
}
