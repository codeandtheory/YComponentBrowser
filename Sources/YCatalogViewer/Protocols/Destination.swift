//
//  Destination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// The way to present next ViewController
public enum Presentation {
    /// Present the VC modally
    case modal
    /// Push the VC onto the stack
    case detail
}

/// Destination ViewController
public protocol Destination {
    /// Presentation style of destination VC
    var presentationStyle: Presentation { get }
    
    /// Navigation title of destination VC
    var navigationTitle: String? { get }
    
    /// To get destination view controller
    func getDestinationController() -> UIViewController
}
