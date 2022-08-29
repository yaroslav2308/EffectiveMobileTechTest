//
//  HomeView.swift
//  EffectiveMobileTechTest
//
//  Created by Yaroslav Monastyrev on 24.08.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @State private var hotSales: [HomeStore] = [HomeStore]()
    @State private var bestSeller: [BestSeller] = [BestSeller]()
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
            .padding(.vertical)
            .padding(.horizontal, 25)
            .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Select Category")
                            .font(.custom(customMarkProFontRegular, size: 25).bold())
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("view all")
                                .font(.custom(customMarkProFontRegular, size: 15))
                                .foregroundColor(Color.customOrange)
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 23) {
                            ForEach(ProductType.allCases, id: \.self) { type in
                                productTypeView(type: type)
                                    .onTapGesture {
                                        print(index)
                                        switchProuductType(type: type)
                                        print(index)
                                    }
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                    }
                    HStack {
                        HStack(spacing: 20) {
                            Button {
                                
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(Color.customOrange)
                            }
                            TextField("Search", text: .constant(""))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(.white)
                                .shadow(color: .black.opacity(0.1), radius: 7)
                                .frame(maxWidth: .infinity)
                        )
                        
                        ZStack {
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color.customOrange)
                                    Image("qrCode")
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 20)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .frame(maxWidth: 50)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                    
                    HStack {
                        Text("Hot sales")
                            .font(.custom(customMarkProFontRegular, size: 25).bold())
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("see more")
                                .font(.custom(customMarkProFontRegular, size: 15))
                                .foregroundColor(Color.customOrange)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 25)
                    
                    VStack {
                        TabView {
                            ForEach(hotSales, id: \.self) { item in
                                hotSalesView(hotSalesData: item)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .shadow(color: Color.black.opacity(0.14), radius: 10)
                    }
                    .frame(height: 200)
                    
                    HStack {
                        Text("Best seller")
                            .font(.custom(customMarkProFontRegular, size: 25).bold())
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("see more")
                                .font(.custom(customMarkProFontRegular, size: 15))
                                .foregroundColor(Color.customOrange)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 25)
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
                    .fill(homeViewModel.productType == type ? Color.customOrange : Color.white)
                    .frame(width: 71, height: 71)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                
                Image(type.imageName)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .foregroundColor(homeViewModel.productType == type ? Color.white : Color.black.opacity(0.3))
            }
            
            Text(type.title)
                .font(.custom(customMarkProFontRegular, size: 14))
                .foregroundColor(homeViewModel.productType == type ? Color.customOrange : Color.black)
        }
        .background(Color.white)
    }
    
    private func switchProuductType(type: ProductType) {
        withAnimation {
            homeViewModel.productType = type
        }
    }
}

extension HomeView {
    @ViewBuilder
    private func hotSalesView(hotSalesData: HomeStore) -> some View {
        HStack {
            VStack(alignment: .leading) {
                
                if let new = hotSalesData.isNew {
                    Text("New")
                        .font(.custom(customMarkProFontRegular, size: 10).bold())
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(Color.customOrange)
                        )
                    
                }
                VStack(alignment: .leading) {
                    Text(hotSalesData.title)
                        .font(.custom(customMarkProFontRegular, size: 25).bold())
                        .foregroundColor(Color.white)
                    Text(hotSalesData.subtitle)
                        .font(.custom(customMarkProFontRegular, size: 11))
                        .foregroundColor(Color.white)
                }
                Spacer()
                Text("Buy now!")
                    .font(.custom(customMarkProFontRegular, size: 11).bold())
                    .padding(.vertical, 7)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 9)
                            .fill(Color.white)
                    )
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.horizontal, 6)
        .background(
            RemoteImageView(url: hotSalesData.picture, placeholder: {
                Image(systemName: "person")
            }, image: {
                $0
                    .resizable()
                    .frame(height: 182)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
        )
        .padding()
        
        
        
    }
}



// MARK: - Network Stuff
