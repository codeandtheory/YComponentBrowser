//
//  ComponentCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for any view that satifies ContentView
public struct ComponentCategory<View: ContentView>: Classification {
    typealias DisplayView = CatalogDisplayView<View>
    
    /// Name of the category
    public let name: String
    
    /// Destination of the category
    public var destination: Destination {
        CatalogDetailDestination<DisplayView>(navigationTitle: name, models: models)
    }
    
    let models: [DisplayView.Model]
}
