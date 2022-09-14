//
//  IconographyCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for images
public struct IconographyCategory: Classification {
    ///  The type of View category supports
    public typealias View = CatalogDisplayView<IconographyView>
    
    /// Name of the category
    public let name: String
    
    /// Model for the View
    public let models: [View.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    ///  Initialises the category
    /// - Parameters:
    ///   - name: name of the category
    ///   - models:  model for the components to be displayed
    public init(name: String, models: [View.Model]) {
        self.name = name
        self.models = models
    }
}
