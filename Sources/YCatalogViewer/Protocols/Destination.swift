//
//  Destination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// Represents the way to present next ViewController
public enum Presentation {
    /// present the VC modally
    case modal
    /// push the VC
    case detail
}

/// Represents destination ViewController
public protocol Destination {
    /// Represents the presentation style of destination VC
    var presentationStyle: Presentation { get }
    /// Represents the navigation title of destination VC
    var navigationTitle: String? { get }
    /// Represents the destination VC
    var controller: UIViewController { get }
}
