//
//  ImageLoader.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import UIKit
import SwiftUI


class ImageLoaderService: ObservableObject {
    @Published var image = UIImage()

    convenience init(url: String) {
        self.init()
        loadImage(for: url)
    }

    func loadImage(for url: String) {
        guard let safeUrl = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: safeUrl) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
