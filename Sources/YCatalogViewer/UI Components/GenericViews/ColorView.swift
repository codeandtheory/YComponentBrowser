//
//  ColorView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

final class ColorView: UIView {
    typealias Model = UIColor
    
    struct Style {
        static let width: CGFloat = 60
        static let height: CGFloat = 60

        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
        var borderColor: UIColor?
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpColorView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUpColorView() {
        layer.cornerRadius = Style.cornerRadius
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: Style.width),
            heightAnchor.constraint(equalToConstant: Style.height)
        ])
    }
}

extension ColorView: Populatable {
    func populate(with model: Model) {
        backgroundColor = model
    }
}

extension ColorView: Reusable {
    func prepareForReuse() {
        backgroundColor = nil
    }
}
