//
//  CustomTabBarView.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selection: TabBarItem = .explorer
    @State private var cartPresentation: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                
                ScrollView {
                            VStack {
                                Text("abc").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                            }
                            .border(Color.yellow, width: 3)
                            .background(Color.blue)
                        }.padding(10).border(Color.red, width: 3)
                    .opacity(selection == .cart ? 1 : 0)
                ScrollView {
                            VStack {
                                Text("abc").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                            }
                            .border(Color.yellow, width: 3)
                            .background(Color.blue)
                        }.padding(10).border(Color.red, width: 3)
                    .opacity(selection == .profile ? 1 : 0)
                ScrollView {
                            VStack {
                                Text("abc").frame(width: 200, height: 50)
                                Text("def").frame(width: 200, height: 50)
                            }
                            .border(Color.yellow, width: 3)
                            .background(Color.blue)
                        }.padding(10).border(Color.red, width: 3)
                .opacity(selection == .favorites ? 1 : 0)
                HomeView()
                    .opacity(selection == .explorer ? 1 : 0)
            }
//            .ignoresSafeArea(edges: .bottom)
            
            HStack {
                ForEach(TabBarItem.allCases, id: \.self) { tab in
                    Spacer()
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                    Spacer()
                }
            }
            .frame(height: 72)
            .frame(maxWidth: .infinity)
            .background(Color.customDarkBlue)
            .cornerRadius(30)
            .padding(.horizontal, 12)
        }
    }
}

struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        HStack(spacing: 10) {
            Image(tab.iconImageName)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: tab == .explorer ? 10 : 17)
                .font(.subheadline)
            if tab == .explorer {
                Text(tab.title)
                    .font(.custom(customMarkProFontRegular, size: 17).bold())
            }
        }
        .foregroundColor(Color.white)
        .padding(.vertical, 10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        
        selection = tab
    }
}
