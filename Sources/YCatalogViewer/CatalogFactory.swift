//
//  CatalogFactory.swift
//
//  Created by Y Media Labs on 08/09/22.
//

import UIKit
/// CatalogFactoty to hide creation logic of catalog and controllers
public enum CatalogFactory {
    ///  Types of generic display ViewController
    public enum DisplayType {
        /// TableViewController
        case table
        /// CollectionViewController
        case collection(UICollectionViewLayout)
    }
    
    ///  Used to create catalogViewer
    /// - Parameters:
    ///   - categories: array of categories in catalog
    ///   - navigationTitle:  title of the catalog
    ///   - embedInNavigationController: bool indicating whether vc should be embeded in navigationController or not
    /// - Returns: UIViewController
    public static func createCatalogViewer<T: Classification>(
        with categories: [T],
        navigationTitle: String? = nil,
        embedInNavigationController: Bool
    ) -> UIViewController {
        let viewcontroller = createClassificationViewController(with: categories, navigationTitle: navigationTitle)
        if embedInNavigationController == true {
            let navigationController = UINavigationController(rootViewController: viewcontroller)
            return navigationController
        }
        return viewcontroller
    }
    
    /// Used to create classificationController
    /// - Parameters:
    ///   - categories: array of categories
    ///   - navigationTitle: title for the VC
    /// - Returns: UIViewController
    public static func createClassificationViewController(
        with categories: [Classification],
        navigationTitle: String? = nil
    ) -> UIViewController {
        return ClassificationViewController(
            datasource: ClassificationDataSource(
                navigationTitle: navigationTitle ?? "",
                classification: categories
            )
        )
    }
    
    ///  Used to create generic VC
    /// - Parameters:
    ///   - viewType: the type of view displayed inside GenericVC
    ///   - models:  data model needed for the View
    ///   - display:  display type indicating whether table or collectionView
    ///   - navigationTitle:  title for the VC
    /// - Returns: UIViewController
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
