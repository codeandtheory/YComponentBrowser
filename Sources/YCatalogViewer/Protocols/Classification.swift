//
//  Classification.swift
//
//  Created by Y Media Labs on 10/08/22.
//

import UIKit

/// Represents a category in catalog
public protocol Classification {
    /// Name of the classification
    var name: String { get }
    
    /// Represents destination of the classification
    var destination: Destination { get }
}

public extension Classification {
    /// Represents the presentation style of the classification
    var presentationStyle: Presentation {
        destination.presentationStyle
    }
    
    /// Represents the destination ViewController of the classification
    var destinationController: UIViewController {
        destination.getDestinationController()
    }
}
