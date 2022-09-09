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
    // TODO: Update after catalogFactory Ticket
    public var controller = UIViewController()
}
