//
//  TypographyView.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import UIKit

/// A view to display a given font and text
final public class TypographyView: UILabel {
    ///  Model to initialize the the `TypographyView`
    public struct Model {
        /// Default display text for Typography View Model
        public static let defaultText = "The quick brown fox jumped over the lazy dog."
        /// Font for the  label
        public let font: UIFont
        /// Text for the label
        public let text: String

        /// Initializes Typography View Model
        /// - Parameters:
        ///   - font: the font to use
        ///   - text: the text to display
        public init(font: UIFont, text: String = defaultText) {
            self.font = font
            self.text = text
        }
    }

    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    /// :nodoc:
    public required init?(coder: NSCoder) { nil }

    private func setUpView() {
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}

// MARK: - Populatable

extension TypographyView: Populatable {
    /// :nodoc:
    public func populate(with model: Model) {
        font = model.font
        text = model.text
    }
}

// MARK: - Reusable

extension TypographyView: Reusable {
    /// :nodoc:
    public func prepareForReuse() {
        text = nil
        font = UIFont.systemFont(ofSize: 17)
    }
}
