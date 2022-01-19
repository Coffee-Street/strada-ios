//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    
    @Binding var isOpened: Bool
    
    @State private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    FavoriteMenuView(favoriteMenus: $viewModel.favoriteMenus)
                        .padding(.bottom)
                    Divider()
                        .background(Color.appBrownGray)
                    MenuView(categories: $viewModel.categories, menus: $viewModel.menus)
                        .padding(.top)
                } // ScrollView
                .padding()
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isOpened = false
                        }) {
                            Image(systemName: "multiply")
                                .foregroundColor(.appBlue)
                                .font(.system(size: 30))
                        }
                    }
                    Spacer()
                }
                .padding(.top)
                .padding(.trailing)
            } // ZStack
        } // NavigationView
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView(isOpened: .constant(false))
    }
}
