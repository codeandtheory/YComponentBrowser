//
//  ColorView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

final class ColorView: UIView {
    typealias Model = UIColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpColorView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUpColorView() {
        self.layer.cornerRadius = Style.cornerRadius
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Style.width),
            self.heightAnchor.constraint(equalToConstant: Style.height)
        ])
    }
}

extension ColorView: Populatable {
    func populate(with model: Model) {
        self.backgroundColor = model
    }
}

extension ColorView: Reusable {
    func prepareForReuse() {
        self.backgroundColor = nil
    }
}

struct Style {
    static let width: CGFloat = 60
    static let height: CGFloat = 60

    static let cornerRadius: CGFloat = 10
    static let borderWidth: CGFloat = 1
    var borderColor: UIColor?
}
