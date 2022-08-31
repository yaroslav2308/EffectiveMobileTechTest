//
//  RemoteImageView.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import SwiftUI

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader

    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                Image(systemName: "heart")
            }
        }
    }
}

