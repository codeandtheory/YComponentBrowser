//
//  ColorCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for colors
public struct ColorCategory: Classification {
    /// The type of View category supports
    public typealias View = CatalogDisplayView<ColorView>
    
    /// Name of the category
    public let name: String
    
    /// Model for the View
    public let models: [View.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    /// Initializes a color category
    /// - Parameters:
    ///   - name: color category name
    ///   - models: information about the colors to be displayed
    public init(name: String, models: [View.Model]) {
        self.name = name
        self.models = models
    }
}
