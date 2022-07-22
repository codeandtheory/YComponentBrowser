//
//  Populatable.swift
//
//  Created by Y Media Labs on 22/07/22.
//

import Foundation

public protocol Populatable {
    associatedtype Model
    
    func populate(with model: Model)
}
