//
//  CatalogDisplayView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

/// View that shows a title and detail text and displays a given type of `ContentView`
final public class CatalogDisplayView<View: ContentView>: UIView {
    // MARK: Helper Types

    /// Model to initialize the the catalog display view
    public struct Model {
        /// Title
        public let title: String?
        
        /// Detail description
        public let detail: String?
        
        /// Primary axis for content view
        public let axis: NSLayoutConstraint.Axis
        
        /// Model to populate the content view
        public let model: View.Model

        /// Initializes a catalog display view
        /// - Parameters:
        ///   - title: title
        ///   - detail: detail description (optional), defaults to `nil`
        ///   - axis: primary axis for the content view, defaults to .horizontal
        ///   - model: model to populate the content view
        public init(
            title: String?,
            detail: String? = nil,
            axis: NSLayoutConstraint.Axis = .horizontal,
            model: View.Model
        ) {
            self.title = title
            self.detail = detail
            self.axis = axis
            self.model = model
        }
    }

    private enum Edge {
        case leading, trailing, top, bottom
    }

    private enum Layout {
        static func margin(for edge: Edge) -> CGFloat {
            switch edge {
            case .leading, .top:
                return 10
            case .trailing, .bottom:
                return -10
            }
        }
    }

    // MARK: - Properties

    /// View to display
    public let displayView: View = View(frame: .zero)
    
    private let titleLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor.label

        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .secondaryLabel

        return label
    }()

    private let innerStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill

        return stackView
    }()

    private let outerStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.alignment = .center
        stackView.distribution = .equalSpacing

        return stackView
    }()

    // MARK: Initialization

    /// :nodoc:
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    /// :nodoc:
    public required init?(coder: NSCoder) { nil }

    // MARK: Helper methods
    
    private func setUpView() {
        backgroundColor = .systemBackground
        displayView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(detailLabel)

        outerStackView.addArrangedSubview(innerStackView)
        outerStackView.addArrangedSubview(displayView)

        self.addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Layout.margin(for: .leading)
            ),
            outerStackView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Layout.margin(for: .trailing)
            ),
            outerStackView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Layout.margin(for: .top)
            ),
            outerStackView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: Layout.margin(for: .bottom)
            )
        ])
    }
}

// MARK: - Populatable

extension CatalogDisplayView: Populatable {
    /// :nodoc:
    public func populate(with model: Model) {
        outerStackView.axis = model.axis
        displayView.populate(with: model.model)
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
}

// MARK: - Reusable

extension CatalogDisplayView: Reusable {
    /// :nodoc:
    public func prepareForReuse() {
        displayView.prepareForReuse()
        outerStackView.axis = .horizontal
        titleLabel.text = nil
        detailLabel.text = nil
    }
}

// MARK: - Highlightable

extension CatalogDisplayView: Highlightable {
    /// :nodoc:
    public func setHighlighted(_ isHighlighted: Bool) {
        if let highlightable = displayView as? Highlightable {
            highlightable.setHighlighted(isHighlighted)
        }
    }
}

// MARK: - Selectable

extension CatalogDisplayView: Selectable {
    /// :nodoc:
    public func setSelected(_ isSelected: Bool) {
        if let selectable = displayView as? Selectable {
            selectable.setSelected(isSelected)
        }
    }
}
