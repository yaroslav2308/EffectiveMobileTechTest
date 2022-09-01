//
//  FlexibleSheet.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 01.09.2022.
//

import SwiftUI

struct FlexibleSheet<Content: View>: View {
    
    let content: () -> Content
    var isPresent: Binding<Bool>
    
    init(isPresent: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        
        self.content = content
        self.isPresent = isPresent
        
    }
    
    private func calculateOffset() -> CGFloat {
        
        switch isPresent.wrappedValue {
        case true:
            return UIScreen.main.bounds.height / 20
        case false:
            return UIScreen.main.bounds.height
        }
    }
    
    var body: some View {
        content()
            .frame(height: UIScreen.main.bounds.height / 3)
            .offset(y: calculateOffset())
            .animation(.spring())
            .edgesIgnoringSafeArea(.all)
            .shadow(color: Color.black.opacity(0.1), radius: 50)
    }
}

struct FlexibleSheet_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleSheet(isPresent: .constant(false)) {
            VStack {
                Text("Hello")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
    }
}
