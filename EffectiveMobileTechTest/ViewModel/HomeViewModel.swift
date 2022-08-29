//
//  File.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .phone
    @Published var productCarousel: Int = 0
}
