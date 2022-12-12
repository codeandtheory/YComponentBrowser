//
//  GenericCollectionViewCell.swift
//
//  Created by Y Media Labs on 26/07/22.
//

import UIKit

/// A collection view cell that can display any `Populatable` and `Reusable` view
public final class GenericCollectionViewCell<View: ContentView>: UICollectionViewCell, Identifiable {
    /// The type of data that can be populated
    public typealias Model = View.Model

    /// View to display in the cell
    public let displayedView: View = View(frame: .zero)
    
    /// :nodoc:
    public override var isSelected: Bool {
        didSet {
            if let selectable = displayedView as? Selectable {
                selectable.setSelected(isSelected)
            }
        }
    }
    
    /// :nodoc:
    public override var isHighlighted: Bool {
        didSet {
            if let highlightable = displayedView as? Highlightable {
                highlightable.setHighlighted(isHighlighted)
            }
        }
    }
    
    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialDisplayView()
    }
    
    /// :nodoc:
    public required init?(coder: NSCoder) { nil }
    
    /// :nodoc:
    public override func prepareForReuse() {
        super.prepareForReuse()
        displayedView.prepareForReuse()
    }
    
    /// Populates UI with model data
    /// - Parameter model: data model
    public func populate(with model: Model) {
         displayedView.populate(with: model)
    }

    private func initialDisplayView() {
        contentView.addSubview(displayedView)
        displayedView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            displayedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            displayedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            displayedView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            displayedView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
