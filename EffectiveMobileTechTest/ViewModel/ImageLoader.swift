//
//  ImageLoader.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//


import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: String
    private var cancellable: AnyCancellable?

    init(url: String) {
        self.url = url
    }

    deinit {
        cancel()
    }
    
    func load() {
        guard let safeUrl = URL(string: url) else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: safeUrl)
                    .map { UIImage(data: $0.data) }
                    .replaceError(with: nil)
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] in self?.image = $0 }
    }

    func cancel() {
        cancellable?.cancel()
    }
}


