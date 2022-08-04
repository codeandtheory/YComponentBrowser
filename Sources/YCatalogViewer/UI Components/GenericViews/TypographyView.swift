//
//  TypographyView.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import UIKit

final class TypographyView: UILabel {
    typealias Model = TypographyModel

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
}

extension TypographyView: Populatable {
    func populate(with model: Model) {
        font = model.font
        text = TypographyModel.defaultText
    }
}

extension TypographyView: Reusable {
    func prepareForReuse() {
        text = nil
        font = UIFont.systemFont(ofSize: 17)
    }
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
