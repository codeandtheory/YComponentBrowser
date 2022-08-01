//
//  GenericCollectionViewCell.swift
//
//  Created by Y Media Labs on 26/07/22.
//

import UIKit
///  Represents UICollectionViewCell which will contain View that conforms UIView, Populatble, Reusable
public class GenericCollectionViewCell<View: ContentView>: UICollectionViewCell, Identifiable {
    /// alias for View.Model
    public typealias Model = View.Model
    /// represents view of type ContentView
    public var displayedView: View = View()
    
    /// property indicating if cell is selected
    public override var isSelected: Bool {
        didSet {
            if let selectable = displayedView as? Selectable {
                selectable.setSelected(isSelected)
            }
        }
    }
    
    /// property indicating if cell is highlighted
    public override var isHighlighted: Bool {
        didSet {
            if let highlightable = displayedView as? Highlightable {
                highlightable.setHighlighted(isHighlighted)
            }
        }
    }
    
    /// used to intialize the cell
    /// - Parameter frame:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialDisplayView()
    }
    
    /// used to  Deserialize the cell
    public required init?(coder: NSCoder) {
        return nil
    }
    
    /// method used to perform clean up before reuse
    public override func prepareForReuse() {
        super.prepareForReuse()
        displayedView.prepareForReuse()
    }
    
    ///  method to populate cell with data
    /// - Parameter model: cellModel
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
