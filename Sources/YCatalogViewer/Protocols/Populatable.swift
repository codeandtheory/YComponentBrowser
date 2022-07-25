//
//  Populatable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

///  protocol for populating view with data
public protocol Populatable {
    associatedtype Model
    
/// method to populate view data passed in the Model
/// - Parameter model: Model
    func populate(with model: Model)
}
