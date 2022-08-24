//
//  HomeView.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ZStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("metka")
                            Text("Zihuatanejo, Gro")
                                .font(.custom(customMarkProFontRegular, size: 20))
                                .foregroundColor(Color.black)
                            Image("arrow")
                        }
                    }
                    .frame(alignment: .center)
                    
                    VStack(alignment: .trailing) {
                        Button {
                            
                        } label: {
                            Image("filter")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                
                
            }
            .padding(.horizontal)
            .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Select Category")
                            .font(.custom(customMarkProFontRegular, size: 25).bold())
                            .padding(.horizontal)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("view all")
                                .font(.custom(customMarkProFontRegular, size: 15))
                                .foregroundColor(Color.customOrange)
                        }
                        .padding(.horizontal)

                    }
                    .padding(.vertical)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 23) {
                            ForEach(ProductType.allCases, id: \.self) { type in
                                productTypeView(type: type)
                                    .onTapGesture {
                                        switchProuductType(type: type)
                                    }
                            }
                        }
                        .padding()
                    }
                    
                }
            }
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    @ViewBuilder
    private func productTypeView(type: ProductType) -> some View {
        VStack {
            ZStack {
                Circle()
                    .fill(homeData.productType == type ? Color.customOrange : Color.white)
                    .frame(width: 71, height: 71)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                
                Image(type.imageName)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .foregroundColor(homeData.productType == type ? Color.white : Color.black.opacity(0.3))
            }
            
            Text(type.title)
                .font(.custom(customMarkProFontRegular, size: 14))
                .foregroundColor(homeData.productType == type ? Color.customOrange : Color.black)
        }
        .background(Color.white)
    }
    
    private func switchProuductType(type: ProductType) {
        withAnimation {
            homeData.productType = type
        }
    }
}
