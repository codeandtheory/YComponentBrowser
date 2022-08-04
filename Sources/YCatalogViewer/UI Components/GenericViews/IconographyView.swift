//
//  IconographyView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit

final class IconographyView: UIImageView {
    typealias Model = UIImage
    var uiConstants = IconographyViewConstants()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconographyView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUpIconographyView() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: uiConstants.width),
            self.heightAnchor.constraint(equalToConstant: uiConstants.height)
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

struct IconographyViewConstants {
    var width: CGFloat = 60
    var height: CGFloat = 60
}
