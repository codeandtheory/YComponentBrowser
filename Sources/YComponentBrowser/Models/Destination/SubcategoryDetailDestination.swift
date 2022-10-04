//
//  SubcategoryDetailDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

/// Subcategory destination
public struct SubcategoryDetailDestination: Destination {
    /// Presentation style of subcategory
    public var presentationStyle: Presentation = .detail
    
    /// Navigation title for subcategory VC
    public let navigationTitle: String?
    
    /// Subcategories of the category
    public let subcategories: [Classification]
    
    /// Creates a subcategory view controller
    public func getDestinationController() -> UIViewController {
        return CatalogFactory.createClassificationViewController(with: subcategories, navigationTitle: navigationTitle)
    }
}
