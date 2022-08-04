//
//  CatalogDisplayView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

typealias DisplayView = UIView & Populatable & Highlightable & Selectable & Reusable

final class CatalogDisplayView<View: DisplayView>: UIView {
    public struct CatalogDisplayModel {
        let title: String?
        let detail: String?
        let displayViewAxis: NSLayoutConstraint.Axis
        let displayViewModel: View.Model
    }
    
    let titleLabel = UILabel()
    let detailLabel = UILabel()
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
    
    func populate(with model: CatalogDisplayModel) {
        outerStackView.axis = model.displayViewAxis
        displayView.populate(with: model.displayViewModel)
    }
    
    func setHighlighted(_ isHighlighted: Bool) {
        displayView.setHighlighted(isHighlighted)
    }
    
    func setSelected(_ isSelected: Bool) {
        displayView.setSelected(isSelected)
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
