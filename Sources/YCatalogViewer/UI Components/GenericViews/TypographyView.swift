//
//  TypographyView.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import UIKit

final class TypographyView: UILabel, Populatable, Reusable {
    typealias Model = TypographyModel
    
    func prepareForReuse() {
        self.font = UIFont()
    }
    
    func populate(with model: Model) {
        self.font = model.font
        self.text = TypographyModel.defaultText
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
}

///  Model to initialize the the typographyView
public struct TypographyModel {
    /// font for typographyView  label
    public let font: UIFont
    
    static let defaultText = "The quick brown fox jumped over the lazy dog."
    
    /// initializer
    /// - Parameter font: UIFont
    public init(font: UIFont) {
        self.font = font
    }
}
