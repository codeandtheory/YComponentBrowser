//
//  SubcategoryDestination.swift
//
//  Created by Y Media Labs on 05/09/22.
//

import UIKit

///  Represents the sub category destination
public struct SubcategoryDetailDestination: Destination {
    /// NavigationTitle for subcategory VC
    public var navigationTitle: String?
    
    ///  Represents subcateogries of the category
    public var subcategories: [Classification]
    /// Represents the presentation style of subcategory
    public var presentationStyle: Presentation = .detail
    /// Represents the sub category view controller
    // TODO: Update after catalogFactory Ticket
    public var controller = UIViewController()
}
