//
//  IconCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for icons (intended for small images having a fixed size and ratio)
public struct IconCategory: Classification {
    /// The type of View category supports
    public typealias View = CatalogDisplayView<IconView>
    
    /// Name of the category
    public let name: String
    
    /// Model for the View
    public let models: [View.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<View>(navigationTitle: name, models: models)
    }
    
    /// Initializes an icon category
    /// - Parameters:
    ///   - name: icon category name
    ///   - models: information about the icons to be displayed
    public init(name: String, models: [View.Model]) {
        self.name = name
        self.models = models
    }
}
