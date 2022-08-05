//
//  CatalogDisplayView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

final class CatalogDisplayView<View: ContentView>: UIView, Populatable, Highlightable, Reusable, Selectable {
    public struct Model {
        let title: String?
        let detail: String?
        let displayViewAxis: NSLayoutConstraint.Axis
        let displayViewModel: View.Model
    }
    
    let titleLabel: UILabel = {
           let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
           return label
    }()
    
    let detailLabel: UILabel = {
           let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
           return label
    }()
    
    let displayView: View = View()
    let innerStackView = UIStackView()
    let outerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func prepareForReuse() {
        displayView.prepareForReuse()
        outerStackView.removeFromSuperview()
    }
    
    func populate(with model: Model) {
        outerStackView.axis = model.displayViewAxis
        displayView.populate(with: model.displayViewModel)
    }
    
    func setHighlighted(_ isHighlighted: Bool) {
        if let highlightable = displayView as? Highlightable {
            highlightable.setHighlighted(isHighlighted)
        }
    }
    
    func setSelected(_ isSelected: Bool) {
        if let selectable = displayView as? Selectable {
            selectable.setSelected(isSelected)
        }
    }
    
    func setUpView() {
        displayView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        innerStackView.addSubview(titleLabel)
        innerStackView.addSubview(detailLabel)
        innerStackView.axis = .vertical
        
        self.addSubview(outerStackView)
        outerStackView.addSubview(innerStackView)
        outerStackView.addSubview(displayView)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            outerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

import SwiftUI

struct CatalogDisplayViewContainer: UIViewRepresentable {
    typealias UIViewType = CatalogDisplayView<ColorView>

    let model: CatalogDisplayView<ColorView>.Model

    init(title: String, detail: String = "", color: UIColor) {
        self.model = CatalogDisplayView<ColorView>.Model(
            title: title,
            detail: detail,
            displayViewAxis: .horizontal,
            displayViewModel: color
        )
    }

    func makeUIView(context: Context) -> UIViewType {
        let view = CatalogDisplayView<ColorView>()
        view.populate(with: model)
        return view
    }

    func updateUIView(_ uiView: CatalogDisplayView<ColorView>, context: Context) {}
}

struct CatalogDisplayViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            CatalogDisplayViewContainer(title: "Red", detail: "System", color: .systemRed)
                .colorScheme(.light)
            CatalogDisplayViewContainer(title: "Red", detail: "System", color: .systemRed)
                .colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375, height: 60))
    }
}
