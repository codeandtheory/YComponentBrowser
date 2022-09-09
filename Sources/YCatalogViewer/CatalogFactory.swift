//
//  CatalogFactory.swift
//
//  Created by Y Media Labs on 08/09/22.
//

import UIKit

enum CatalogFactory {
    enum DisplayType {
        case table
        case collection(UICollectionViewLayout)
    }
    
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
