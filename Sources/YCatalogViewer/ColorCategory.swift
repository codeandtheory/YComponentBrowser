//
//  ColorCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for colors
public struct ColorCategory: Classification {
  typealias View = CatalogDisplayView<ColorView>
    
  /// Name of the category
  public let name: String
    
  /// Destination of the category
  public var destination: Destination {
      CatalogDetailDestination<View>(navigationTitle: "ColorCategory", models: models)
  }
    
  let models: [View.Model]
}
