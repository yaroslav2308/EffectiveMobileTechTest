//
//  Product.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import Foundation



// ProductTypes
enum ProductType: CaseIterable {
    case phone
    case computer
    case health
    case books
    case other
    
    var title: String {
        switch self {
        case .phone:
            return "Phones"
        case .computer:
            return "Computer"
        case .health:
            return "Health"
        case .books:
            return "Books"
        case .other:
            return "Other"
        }
    }
    
    var imageName: String {
        switch self {
        case .phone:
            return "phone"
        case .computer:
            return "computer"
        // Change health image to similar one cause previous had a bug
        case .health:
            return "health"
        case .books:
            return "books"
        case .other:
            return "other"
        }
    }
}
