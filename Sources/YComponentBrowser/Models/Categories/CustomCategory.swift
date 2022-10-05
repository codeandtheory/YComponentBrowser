//
//  CustomCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Custom category for components that will not utilize `CatalogDisplayView`.
///
/// Suitable for larger components, such as cards, that might occupy an entire table view (or collection view) cell
/// by themselves.
/// Also suitable when you wish to define your own custom `ContentView` to display the component.
public struct CustomCategory<View: ContentView>: Classification {
    /// Name of the category
    public let name: String
    
    /// Model for the View
    let models: [View.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    /// Initializes a custom category
    /// - Parameters:
    ///   - name: category name
    ///   - models: information about the components to be displayed
    public init(name: String, models: [View.Model]) {
        self.name = name
        self.models = models
    }
}
