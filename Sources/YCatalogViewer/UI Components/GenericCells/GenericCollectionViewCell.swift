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
    /// Represents view of type ContentView
    public var displayedView: View = View()
    
    /// Property indicating if cell is selected
    public override var isSelected: Bool {
        didSet {
            if let selectable = displayedView as? Selectable {
                selectable.setSelected(isSelected)
            }
        }
    }
    
    /// Property indicating if cell is highlighted
    public override var isHighlighted: Bool {
        didSet {
            if let highlightable = displayedView as? Highlightable {
                highlightable.setHighlighted(isHighlighted)
            }
        }
    }
    
    /// Initializes the generic cell
    /// - Parameter frame: initial frame (defaults to `.zero`)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialDisplayView()
    }
    
    ///  :nodoc:
    public required init?(coder: NSCoder) { return nil }
    
    /// :nodoc:
    public override func prepareForReuse() {
        super.prepareForReuse()
        displayedView.prepareForReuse()
    }
    
    /// Used to populate UI component data passed in the Model
    /// - Parameter model: Model
    public func populate(with model: Model) {
         displayedView.populate(with: model)
    }
}

private extension GenericCollectionViewCell {
    func initialDisplayView() {
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
