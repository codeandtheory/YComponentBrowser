//
//  Classification.swift
//
//  Created by Y Media Labs on 10/08/22.
//

import UIKit

/// A category in catalog
public protocol Classification {
    /// Name of the classification
    var name: String { get }
    
    /// Destination of the classification
    var destination: Destination { get }
}

public extension Classification {
    /// Presentation style of the classification
    var presentationStyle: Presentation {
        destination.presentationStyle
    }
    
    /// Destination view controller of the classification
    var destinationController: UIViewController {
        destination.getDestinationController()
    }
}
