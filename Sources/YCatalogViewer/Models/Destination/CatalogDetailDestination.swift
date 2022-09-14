//
//  CatalogDetailDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// Catalog detail destination
public struct CatalogDetailDestination<View: ContentView>: Destination {
    /// Presentation style of catalog destination view controller
    public var presentationStyle: Presentation = .detail
    
    ///  NavigationTitle of the destination screen
    public let navigationTitle: String?
    
    /// The model of catalog destination view controller
    public let models: [View.Model]
    
    /// Creates a tableview controller that displays the model data within the specified view
    public func getDestinationController() -> UIViewController {
        return CatalogFactory.createGenericDisplayViewController(
            viewType: View.self,
            models: models,
            navigationTitle: navigationTitle
        )
    }
    
    /// Initializes a catalog detail destination
    /// - Parameters:
    ///   - presentationStyle: presentation style (modal or on stack)
    ///   - navigationTitle:  Title for the view controller
    ///   - models:  Model for the view to be displayed in Catalog detail destination
    public init(presentationStyle: Presentation = .detail, navigationTitle: String?, models: [View.Model]) {
        self.presentationStyle = presentationStyle
        self.navigationTitle = navigationTitle
        self.models = models
    }
}
