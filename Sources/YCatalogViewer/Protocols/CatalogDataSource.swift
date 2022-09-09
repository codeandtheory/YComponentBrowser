//
//  CatalogDataSource.swift
//
//  Created by Y Media Labs on 10/08/22.
//

import UIKit

/// Represents datasource for catalog tableview
public protocol CatalogDataSource: UITableViewDataSource {
    /// The type of cell catalogDataSource supports
    associatedtype Cell: UITableViewCell
    /// Represents the cell type
    static var cell: Cell.Type { get }
    /// Identifier to identify the cell
    static var cellIdentifier: String { get }
    /// Represents the title of catalog
    var navigationTitle: String? { get }
    /// Represents categories in the catalog
    var categories: [Classification] { get }
    
    /// Method to get category based on indexpath
    /// - Parameter indexPath: indexpath of tableview
    func category(for indexPath: IndexPath) -> Classification
}
