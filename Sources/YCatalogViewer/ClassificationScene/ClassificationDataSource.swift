//
//  ClassificationDataSource.swift
//
//  Created by Y Media Labs on 10/08/22.
//

import UIKit

/// Represents the Classification Datasource
public final class ClassificationDataSource: NSObject, CatalogDataSource {
    /// The type of cell catalogDataSource supports
    public typealias Cell = UITableViewCell
    
    /// Represents the cell type
    public static var cell: Cell.Type { UITableViewCell.self }
    
    /// Identifier to identify the cell
    public static var cellIdentifier: String { "ClassificationTableCell" }
    
    /// Represents the title of catalog
    public let navigationTitle: String?
    
    /// Represents categories in the catalog
    public let categories: [Classification]
    
    /// Initializes a  classification data source
    /// - Parameters:
    /// - navigationTitle:the text to be displayed in the navigation bar
    /// - classification: array of categories
    public init(navigationTitle: String?, classification: [Classification]) {
        self.navigationTitle = navigationTitle
        categories = classification
    }
    
    /// :nodoc:
    public func category(for indexPath: IndexPath) -> Classification {
        return categories[indexPath.row]
    }
    
    /// :nodoc:
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    /// :nodoc:
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ClassificationDataSource.cellIdentifier,
            for: indexPath
        )
        let category = category(for: indexPath)

        cell.textLabel?.text = category.name
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        return cell
    }
}
