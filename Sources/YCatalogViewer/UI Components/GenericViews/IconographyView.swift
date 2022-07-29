//
//  IconographyView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit
    typealias ImageView = UIImageView & Populatable & Reusable
class IconographyView<View: ImageView>: UIView {
    var imageView: View = View()
    func prepareForReuse() {
    }
    
    func populate(with model: View.Model) {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconographyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpIconographyView() {
        self.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
