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
  public let name: String
    
  /// Destination of the category
  public var destination: Destination {
      CatalogDetailDestination<View>(navigationTitle: "IconCategory", models: models)
  }
    
  let models: [View.Model]
}
