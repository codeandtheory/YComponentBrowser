//
//  ColorView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

/// A view used to display a given `UIColor` at a fixed size
final public class ColorView: UIView {
    /// The type of data required to populate the `ColorView`
    public typealias Model = UIColor
    
    private enum Style {
        static let size = CGSize(width: 60, height: 60)
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
    }

    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpColorView()
    }

    /// :nodoc:
    public required init?(coder: NSCoder) { nil }
    
    private func setUpColorView() {
        clipsToBounds = true
        layer.cornerRadius = Style.cornerRadius

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: Style.size.width),
            heightAnchor.constraint(equalToConstant: Style.size.height)
        ])
    }
}

// MARK: - Populatable

extension ColorView: Populatable {
    /// :nodoc:
    public func populate(with model: Model) {
        backgroundColor = model
    }
}

// MARK: - Reusable

extension ColorView: Reusable {
    /// :nodoc:
    public func prepareForReuse() {
        backgroundColor = nil
    }
}
