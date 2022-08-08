//
//  TypographyView.swift
//
//  Created by Y Media Labs on 03/08/22.
//

import UIKit

final class TypographyView: UILabel {
    ///  Model to initialize the the typographyView
    public struct Model {
        /// font for the  label
        public let font: UIFont
        /// text for the label
        public let text: String
        /// Default display text for Typography View Model
        public static let defaultText = "The quick brown fox jumped over the lazy dog."
        
        /// Initializes Typography View Model
        /// - Parameters:
        ///   - font: the font to use
        ///   - text: the text to display
        public init(font: UIFont, text: String = defaultText) {
            self.font = font
            self.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) { nil }
}

extension TypographyView: Populatable {
    func populate(with model: Model) {
        font = model.font
        text = model.text
    }
}

extension TypographyView: Reusable {
    func prepareForReuse() {
        text = nil
        font = UIFont.systemFont(ofSize: 17)
    }
}

private extension TypographyView {
    func setUpView() {
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}

import SwiftUI

struct TypographyViewContainer: UIViewRepresentable {
    let font: UIFont

    init(font: UIFont) {
        self.font = font
    }

    func makeUIView(context: Context) -> UIViewType {
        let view = TypographyView(frame: .zero)
        let model = TypographyView.Model(font: font)
        view.populate(with: model)
        return view
    }

    func updateUIView(_ uiView: TypographyView, context: Context) {}
}

struct TypographyViewPreviews: PreviewProvider {
    static var previews: some View {
        TypographyViewContainer(font: UIFont.preferredFont(forTextStyle: .title1))
    }
}
