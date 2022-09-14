//
//  CustomCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Custom category for View that satisfies protocols
public struct CustomCategory<View: ContentView>: Classification {
    /// Name of the category
    public let name: String
    
    /// Model for the View
    let models: [View.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    ///  Initializes a category
    /// - Parameters:
    ///   - name: name of the category
    ///   - models: model for the components to be displayed
    public init(name: String, models: [View.Model]) {
        self.name = name
        self.models = models
    }
}
