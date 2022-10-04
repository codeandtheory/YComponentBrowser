//
//  Destination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// How to present a view controller
public enum Presentation {
    /// Present the VC modally
    case modal
    /// Push the VC onto the stack
    case detail
}

/// Destination ViewController
public protocol Destination {
    /// Presentation style of destination view controller
    var presentationStyle: Presentation { get }
    
    /// Navigation title of destination view controller
    var navigationTitle: String? { get }
    
    /// Creates destination view controller
    func getDestinationController() -> UIViewController
}
