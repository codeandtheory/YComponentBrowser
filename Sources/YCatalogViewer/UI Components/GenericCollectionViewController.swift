//
//  GenericCollectionViewController.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import Foundation
import UIKit

/// GenericCollectionViewController that can display `Populatable` and `Reusable` view
final public class GenericCollectionViewController<View: ContentView>: UICollectionViewController {
    private typealias GenericCell = GenericCollectionViewCell<View>
    
    private var models: [View.Model]
    
    ///  Used to initialize the GenericCollectionViewController
    /// - Parameters:
    ///   - navigationTitle: title text
    ///   - collectionViewLayout: UICollectionViewLayout
    ///   - models:  array of viewModel of subViews
    public init(
        navigationTitle: String? = nil,
        collectionViewLayout: UICollectionViewLayout? = nil,
        models: [View.Model]
    ) {
        self.models = models
        super.init(collectionViewLayout: collectionViewLayout ?? UICollectionViewFlowLayout())
        self.collectionView.register(GenericCell.self, forCellWithReuseIdentifier: GenericCell.identifier)
        self.navigationItem.title = navigationTitle
    }
    
    /// :nodoc:
    required init?(coder: NSCoder) { nil }
    
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
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GenericCell.identifier,
            for: indexPath
        ) as? GenericCell
        cell?.populate(with: models[indexPath.item])
        return cell ?? GenericCell()
    }
    
    /// :nodoc:
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
