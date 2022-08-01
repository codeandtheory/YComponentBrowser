//
//  IconographyView.swift
//
//  Created by Y Media Labs on 27/07/22.
//

import UIKit
class IconographyView: UIImageView, Populatable, Reusable {
    typealias Model = IconographyDataModel
    var uiConstants = IconographyViewConstants()
    func prepareForReuse() {
        self.image = nil
    }
    
    ///  not able to populate the data since data model is not available
    func populate(with model: Model) {
        // self.image = model.image
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpIconographyView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setUpIconographyView() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: uiConstants.width),
            self.heightAnchor.constraint(equalToConstant: uiConstants.height)
        ])
    }
}

struct IconographyDataModel {
    var image: UIImage?
}

struct IconographyViewConstants {
    var width: CGFloat = 60
    var height: CGFloat = 60
}
