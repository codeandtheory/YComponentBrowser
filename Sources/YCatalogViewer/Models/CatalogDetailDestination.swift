//
//  CatalogDetailDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// Represents the CatalogDetailDestination
public struct CatalogDetailDestination<View: ContentView>: Destination {
    /// Represents the presentation style of catalog destination VC
    public var presentationStyle: Presentation = .detail
    ///  NavigationTitle of the destination screen
    public let navigationTitle: String?
    /// Represents the model of catalog destination VC
    public let models: [View.Model]
    // Creates a tableview controller that displays the model data within the specified view
    public var controller: UIViewController {
        CatalogFactory.createGenericDisplayViewController(
            viewType: View.self,
            models: models,
            navigationTitle: navigationTitle
        )
    }

    // TODO: Add Documentation
    public init(presentationStyle: Presentation = .detail, navigationTitle: String?, models: [View.Model]) {
        self.presentationStyle = presentationStyle
        self.navigationTitle = navigationTitle
        self.models = models
    }
}
