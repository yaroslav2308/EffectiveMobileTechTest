//
//  ContentView.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import SwiftUI

let customMarkProFontRegular = "MarkPro-Regular"

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .font(.custom(customMarkProFontRegular, size: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
