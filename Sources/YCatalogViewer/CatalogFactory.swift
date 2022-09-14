//
//  CatalogFactory.swift
//
//  Created by Y Media Labs on 08/09/22.
//

import UIKit

/// CatalogFactory to encapsulate the creation logic of catalog and controllers
public enum CatalogFactory {
    ///  Types of generic display ViewController
    public enum DisplayType {
        /// TableViewController
        case table
        
        /// CollectionViewController
        case collection(UICollectionViewLayout)
    }
    
    /// Creates a catalog viewer view controller
    /// - Parameters:
    ///   - categories: array of categories in catalog
    ///   - navigationTitle:  title of the catalog
    ///   - embedInNavigationController:
    ///   bool indicating whether view controller should be embedded in navigationController or not
    /// - Returns: A catalog viewer view controller
    public static func createCatalogViewer<T: Classification>(
        with categories: [T],
        navigationTitle: String? = nil,
        embedInNavigationController: Bool
    ) -> UIViewController {
        let controller = createClassificationViewController(with: categories, navigationTitle: navigationTitle)
        if embedInNavigationController == true {
            let navigationController = UINavigationController(rootViewController: controller)
            return navigationController
        }
        return controller
    }
    
    /// Creates a classification view controller
    /// - Parameters:
    ///   - categories: array of categories
    ///   - navigationTitle: title for the view controller
    /// - Returns: A classification view controller
    public static func createClassificationViewController(
        with categories: [Classification],
        navigationTitle: String? = nil
    ) -> UIViewController {
        return ClassificationViewController(
            datasource: ClassificationDataSource(
                navigationTitle: navigationTitle,
                classification: categories
            )
        )
    }
    
    /// Creates generic view controller
    /// - Parameters:
    ///   - viewType: the type of view displayed inside the generic view controller
    ///   - models:  data model needed for the View
    ///   - display:  display type indicating whether table or collectionView
    ///   - navigationTitle: title for the view controller
    /// - Returns: a view controller of the specified type
    public static func createGenericDisplayViewController<T: ContentView>(
        viewType: T.Type,
        models: [T.Model],
        display: DisplayType = .table,
        navigationTitle: String? = nil
    ) -> UIViewController {
        switch display {
        case .table:
            let controller = GenericTableViewController<T>(navigationTitle: navigationTitle, models: models)
            return controller
        case .collection(let layout):
            let controller = GenericCollectionViewController<T>(
                navigationTitle: navigationTitle,
                collectionViewLayout: layout,
                models: models
            )
            return controller
        }
    }
}
