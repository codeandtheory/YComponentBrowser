//
//  TypographyCategory.swift
//
//  Created by Y Media Labs on 12/09/22.
//

import Foundation

/// Category for fonts and text
public struct TypographyCategory: Classification {
  typealias View = CatalogDisplayView<TypographyView>
    
  /// Name of the category
  public let name: String
    
  /// Destination of the category
  public var destination: Destination {
      CatalogDetailDestination<View>(navigationTitle: "TypographyCategory", models: models)
  }
    
  let models: [View.Model]
}
