//
//  GenericCollectionViewController.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import Foundation
import UIKit

/// A Generic CollectionViewController that can display `Populatable` and `Reusable` view
final public class GenericCollectionViewController<View: ContentView>: UICollectionViewController {
    private typealias GenericCell = GenericCollectionViewCell<View>
    
    private var models: [View.Model]
    
    /// Initializes a generic collection view controller
    /// - Parameters:
    /// - navigationTitle: text to be displayed in the navigation bar if a value is given
    /// - collectionViewLayout: layout to use within the collection view, defaults to a flow layout
    /// - models: data to populate the given containing  view to be displayed within  the collection view
    public init(
        navigationTitle: String? = nil,
        collectionViewLayout: UICollectionViewLayout = UICollectionViewFlowLayout(),
        models: [View.Model]
    ) {
        self.models = models
        super.init(collectionViewLayout: collectionViewLayout)
        self.collectionView.register(GenericCell.self, forCellWithReuseIdentifier: GenericCell.identifier)
        self.navigationItem.title = navigationTitle
    }
    
    /// :nodoc:
    public required init?(coder: NSCoder) { nil }
    
    /// :nodoc:
    public override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    /// :nodoc:
    public override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GenericCell.identifier,
            for: indexPath
        ) as? GenericCell else {
            fatalError("Unable to dequeue cell of type: \(GenericCell.self)")
        }

        cell.populate(with: models[indexPath.item])

        return cell
    }
    
    /// :nodoc:
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
