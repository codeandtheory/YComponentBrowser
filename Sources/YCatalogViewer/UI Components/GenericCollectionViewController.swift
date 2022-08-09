//
//  GenericCollectionViewController.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import Foundation
import UIKit

final public class GenericCollectionViewController<View: ContentView>: UICollectionViewController {
    private typealias GenericCell = GenericCollectionViewCell<View>
    
    var models: [View.Model]
    
    init(navigationTitle: String? = nil, collectionViewLayout: UICollectionViewLayout? = nil, models: [View.Model]) {
        self.models = models
        super.init(nibName: nil, bundle: nil)
        self.collectionView.register(GenericCell.self, forCellWithReuseIdentifier: GenericCell.identifier)
        if let collectionViewLayout = collectionViewLayout {
            self.collectionView.collectionViewLayout = collectionViewLayout
        }
        self.navigationItem.title = navigationTitle
    }
    
    required init?(coder: NSCoder) { nil }
    
    public override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    public override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = GenericCollectionViewCell<View>(frame: .init())
        cell.populate(with: models[indexPath.item])
        return cell
    }
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
