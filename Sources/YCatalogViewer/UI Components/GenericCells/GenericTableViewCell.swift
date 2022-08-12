//
//  GenericTableViewCell.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import UIKit

/// A table view cell that can display any `Populatable` and `Reusable` view
public final class GenericTableViewCell<View: ContentView>: UITableViewCell, Identifiable {
    /// The type of data that can be populated
    public typealias Model = View.Model
    
    /// Represents view of type ContentView
    public let displayedView: View = View(frame: .zero)
    
    /// :nodoc:
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialDisplayView()
    }
    
    /// :nodoc:
    public required init?(coder: NSCoder) {
        return nil
    }
    
    /// :nodoc:
    public override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if let highlightable = displayedView as? Highlightable {
            highlightable.setHighlighted(highlighted)
        }
    }
    
    /// :nodoc:
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let selectable = displayedView as? Selectable {
            selectable.setSelected(selected)
        }
    }
    
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
