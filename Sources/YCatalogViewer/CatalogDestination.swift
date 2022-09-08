//
//  CatalogDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// Represents the CatalogDetailDestination
public struct CatalogDetailDestination<View: ContentView>: Destination {
    ///  NavigationTitle of the destination screen
    public var navigationTitle: String?
    /// Represents the model of catalog destination VC
    public var models: [View.Model]
    /// Represents the presentation style of catalog destination VC
    public var presentationStyle: Presentation = .detail
    // TODO: Update after catalogFactory Ticket
    public var controller = UIViewController()
}
