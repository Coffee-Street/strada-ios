//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    
    @State private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    FavoriteMenuView(favoriteMenus: $viewModel.favoriteMenus)
                        .padding(.bottom)
                    Divider()
                        .background(Color.appBrownGray)
                    MenuView(categories: $viewModel.categories, menus: $viewModel.menus)
                        .padding(.top)
                }
            } // ScrollView
            .padding()
            .navigationBarTitle(Text(""), displayMode: .inline)
        } // NavigationView
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
