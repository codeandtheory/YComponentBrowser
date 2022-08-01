//
//  Populatable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

/// Represents anything that can be populated
public protocol Populatable {
    /// The type of data that can be populated
    associatedtype Model
    
/// used to populate UI component data passed in the Model
/// - Parameter model: Model
    func populate(with model: Model)
}
