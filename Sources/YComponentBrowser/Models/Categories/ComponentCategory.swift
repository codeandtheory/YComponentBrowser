//
//  ComponentCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for small views that will be displayed in a table or collection view cell.
///
/// Suitable for buttons, switches, badges, and other small components.
public struct ComponentCategory<View: ContentView>: Classification {
    /// The type of View category supports
    public typealias DisplayView = CatalogDisplayView<View>
    
    /// Name of the category
    public let name: String
    
    /// Model for the DisplayView
    public let models: [DisplayView.Model]
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<DisplayView>(navigationTitle: name, models: models)
    }
    
    /// Initializes a component category
    /// - Parameters:
    ///   - name: component category name
    ///   - models: information about the components to be displayed
    public init(name: String, models: [DisplayView.Model]) {
        self.name = name
        self.models = models
    }
}
