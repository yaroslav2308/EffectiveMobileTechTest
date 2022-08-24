//
//  TabBarItem.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import Foundation

enum TabBarItem: Hashable, CaseIterable {
    case explorer, cart, profile, favorites
    
    var iconImageName: String {
        switch self {
        case .explorer: return "ellipse"
        case .favorites: return "heart"
        case .profile: return "profile"
        case .cart: return "cart"
        }
    }
    
    var title: String {
        switch self {
        case .explorer: return "Explorer"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .cart: return "Cart"
        }
    }
}
