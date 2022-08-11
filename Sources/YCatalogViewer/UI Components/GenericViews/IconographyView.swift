//
//  IconographyView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit

/// A view to display a given image at a fixed size and ratio
final public class IconographyView: UIImageView {
    /// The type of data required to populate the `IconographyView`
    public typealias Model = UIImage
    
    private enum Style {
        static let size = CGSize(width: 60, height: 60)
    }

    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconographyView()
    }

    /// :nodoc:
    public required init?(coder: NSCoder) { nil }
    
    private func setUpIconographyView() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Style.size.width),
            self.heightAnchor.constraint(equalToConstant: Style.size.height)
        ])
    }
}

// MARK: - Populatable

extension IconographyView: Populatable {
    /// :nodoc:
    public func populate(with model: Model) {
        self.image = model
    }
}

// MARK: - Reusable

extension IconographyView: Reusable {
    /// :nodoc:
    public func prepareForReuse() {
        self.image = nil
    }
}
