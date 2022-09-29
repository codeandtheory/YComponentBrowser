//
//  IconView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit

/// A view to display a given image at a fixed size and ratio
final public class IconView: UIImageView {
    /// The type of data required to populate the Icon view
    public typealias Model = UIImage
    
    private enum Style {
        static let size = CGSize(width: 60, height: 60)
    }

    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconView()
    }

    /// :nodoc:
    public required init?(coder: NSCoder) { nil }
    
    private func setUpIconView() {
        contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Style.size.width),
            self.heightAnchor.constraint(equalToConstant: Style.size.height)
        ])
    }
}

// MARK: - Populatable

extension IconView: Populatable {
    /// :nodoc:
    public func populate(with model: Model) {
        self.image = model
    }
}

// MARK: - Reusable

extension IconView: Reusable {
    /// :nodoc:
    public func prepareForReuse() {
        self.image = nil
    }
}
