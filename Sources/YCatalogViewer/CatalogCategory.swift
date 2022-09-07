//
//  CatalogCategory.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import Foundation

/// Represents catalog category
public struct CatalogCategory: Classification {
    /// Represents destination of the catalog category
    public var destination: Destination
    /// Name of the catalog category
    public var name: String
    /// Represents the subcategories of the given category
    var subcategories: [Classification]
}
