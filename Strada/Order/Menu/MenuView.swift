//
//  MenuView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/15.
//

import SwiftUI

struct MenuView : View {
    @ObservedObject var controller: CurrentViewController
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            FavoriteMenuView(favoriteMenus: $viewModel.favoriteMenus)
                .padding(.bottom)
            
            Divider()
                .frame(height: 1)
                .background(Color.appVeryLightGray)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 0) {
                CategoryView(categories: viewModel.categories, selected: $viewModel.selectedCategory)
                .padding(.vertical)
                .onAppear {
                    viewModel.selectedCategory = viewModel.categories.first ?? ""
                }
                
                VStack {
                    if viewModel.getMenusByCategory(selected: viewModel.selectedCategory).count > 0 {
                        ForEach(viewModel.getMenusByCategory(selected: viewModel.selectedCategory)) { menu in
                            NavigationLink(destination: OrderDetailView(controller: controller, menu_id: menu.id)) {
                                MenuItemView(menu: menu)
                            }
                        }
                        .navigationBarTitle(Text(""))
                        
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .onAppear {
            viewModel.getMenus()
        }
    }
}

struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView(controller: CurrentViewController("menu"))
    }
}
