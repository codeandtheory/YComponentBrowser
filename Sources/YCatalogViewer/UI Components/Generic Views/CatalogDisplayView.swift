//
//  CatalogDisplayView.swift
//
//  Created by Y Media Labs on 28/07/22.
//

import UIKit

/// A view that shows a title and detail text and displays a given type of `ContentView`
final public class CatalogDisplayView<View: ContentView>: UIView {
    // MARK: Helper Types

    /// Model to initialize the the `CatalogDisplayView`
    public struct Model {
        /// A title that gives information on the given `ContentView`
        public let title: String?
        /// A detail that given more content or description of the given `ContentView`
        public let detail: String?
        /// The axis on how you want the title and detail information to display in relation to the `ContentView`
        public let displayViewAxis: NSLayoutConstraint.Axis
        /// The model that is needed to populate the given `ContentView`
        public let displayViewModel: View.Model

        /// Used to initialize the `CatalogDisplayView`
        /// - Parameters:
        /// - title:the title to describe the given `ContentView`
        /// - detail: to give more context about the given `ContentView`
        /// - displayViewAxis: the axis to display the title and detail information in relation to the `ContentView`
        /// - displayViewModel: the model that is used to populate the given `ContentView`
        public init(
            title: String?,
            detail: String?,
            displayViewAxis: NSLayoutConstraint.Axis,
            displayViewModel: View.Model
        ) {
            self.title = title
            self.detail = detail
            self.displayViewAxis = displayViewAxis
            self.displayViewModel = displayViewModel
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

    /// Represents the view of the given `ContentView`
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
        outerStackView.axis = model.displayViewAxis
        displayView.populate(with: model.displayViewModel)
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
