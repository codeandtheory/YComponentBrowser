//
//  CatalogDataSource.swift
//
//  Created by Y Media Labs on 10/08/22.
//

import UIKit

/// Data source for catalog tableview
public protocol CatalogDataSource: UITableViewDataSource {
    /// The type of cell catalog data source supports
    associatedtype Cell: UITableViewCell
    
    /// Cell type
    static var cell: Cell.Type { get }
    
    /// Identifier to identify the cell
    static var cellIdentifier: String { get }
    
    /// Catalog title
    var navigationTitle: String? { get }
    
    /// Categories in the catalog
    var categories: [Classification] { get }
    
    /// Gets the category based on the index path
    /// - Parameter indexPath: index path of tableview
    func category(for indexPath: IndexPath) -> Classification
}
