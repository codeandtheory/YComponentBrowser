//
//  CustomCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Custom category for View that satifies protcols
public struct CustomCategory<View: ContentView>: Classification {
    /// Name of the category
    public let name: String
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    let models: [View.Model]
}
