//
// ClassificationViewController.swift
//
// Created by Y Media Labs on 07/09/22.
//

import UIKit
/// ClassificationViewController to display catalog
final class ClassificationViewController<DataSource: CatalogDataSource>: UITableViewController {
    /// Datasource for that catalogView
    var datasource: DataSource
    
    ///  Used to initialize the  `ClassificationViewController`
    /// - Parameters:
    /// - datasource:Datasource for the catalogview
    init(datasource: DataSource) {
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
        self.tableView.register(DataSource.cell, forCellReuseIdentifier: DataSource.cellIdentifier)
        tableView.dataSource = datasource
        self.navigationItem.title = datasource.navigationTitle
    }
    
    /// :nodoc:
    required init?(coder: NSCoder) { return nil }
    
    /// :nodoc:
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = datasource.category(for: indexPath)
        if category.presentationStyle == .detail {
            navigationController?.pushViewController(category.destinationController, animated: true)
        } else {
            present(category.destinationController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
