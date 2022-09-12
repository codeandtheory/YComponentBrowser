//
//  IconographyCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for images
public struct IconographyCategory: Classification {
  typealias View = CatalogDisplayView<IconographyView>
  /// Name of the category
  public var name: String
  /// Represents destination of the IconographyCategory
  public var destination: Destination {
      CatalogDetailDestination<View>(navigationTitle: "IconCategory", models: models)
  }
  var models: [View.Model]
}
