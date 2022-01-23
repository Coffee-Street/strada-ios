//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    @ObservedObject var controller: CurrentViewController
    
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
                    MenuView(controller: controller, categories: $viewModel.categories, menus: $viewModel.menus)
                        .padding(.top)
                } // ScrollView
                .padding()
                
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
            .background(.white)
        } // NavigationView
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView(controller: CurrentViewController("order"), isOpened: .constant(false))
    }
}
