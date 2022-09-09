//
//  SubcategoryDetailDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

///  Represents the sub category destination
public struct SubcategoryDetailDestination: Destination {
    /// Represents the presentation style of subcategory
    public var presentationStyle: Presentation = .detail
    /// NavigationTitle for subcategory VC
    public let navigationTitle: String?
    ///  Represents subcategories of the category
    public let subcategories: [Classification]
    /// Represents the sub category view controller
    // TODO: Update after catalogFactory Ticket
    public var controller = UIViewController()
}
