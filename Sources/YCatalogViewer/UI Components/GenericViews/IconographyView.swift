//
//  IconographyView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit

final class IconographyView: UIImageView {
    typealias Model = UIImage
    
    struct Style {
            static let width: CGFloat = 60
            static let height: CGFloat = 60
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconographyView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUpIconographyView() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Style.width),
            self.heightAnchor.constraint(equalToConstant: Style.height)
        ])
    }
}

extension IconographyView: Populatable {
    func populate(with model: Model) {
        self.image = model
    }
}

extension IconographyView: Reusable {
    func prepareForReuse() {
        self.image = nil
    }
}
