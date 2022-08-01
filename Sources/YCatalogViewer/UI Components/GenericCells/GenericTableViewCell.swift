//
//  GenericTableViewCell.swift
//
//  Created by Y Media Labs on 25/07/22.
//

import UIKit
/// represents  view that conforms to Reusable and Populatable
public typealias ContentView = UIView & Reusable & Populatable

///  Represents UITableViewCell which will contain View that conforms UIView, Populatable, Reusable
public class GenericTableViewCell<View: ContentView>: UITableViewCell, Identifiable {
    /// alias for View.Model
    public typealias Model = View.Model
    /// represents view of type ContentView
    public var displayedView: View = View()
    
    ///  used to initialize the cell
    /// - Parameters:
    ///   - style: constant indicating cell style
    ///   - reuseIdentifier: identifier to specify which cell
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialDisplayView()
    }
    
    /// used to  Deserialize the cell
    public required init?(coder: NSCoder) {
        return nil
    }
    
    /// used to set highlighted state of the cell
    /// - Parameters:
    ///   - highlighted: Bool indicating if highlighted or not
    ///   - animated: Bool indicating if animation is needed
    public override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if let higlightable = displayedView as? Highlightable {
            higlightable.setHighlighted(highlighted)
        }
    }
    
    /// used to set state of cell as selected
    /// - Parameters:
    ///   - selected: Bool indicating if selected or not
    ///   - animated: Bool indicating if animation is needed
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let selectable = displayedView as? Selectable {
            selectable.setSelected(selected)
        }
    }
    
    /// used to perform clean up before reuse
    public override func prepareForReuse() {
        super.prepareForReuse()
        displayedView.prepareForReuse()
    }
    
    ///  used to populate cell with data
    /// - Parameter model: cellModel
    public func populate(with model: Model) {
         displayedView.populate(with: model)
    }
}

private extension GenericTableViewCell {
    /// to set up displayview
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
