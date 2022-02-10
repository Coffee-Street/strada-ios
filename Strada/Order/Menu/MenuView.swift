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
                .background(Color.appBrownGray)
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
                    else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("EMPTY MENUS")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(height: 30)
                                    .padding(.horizontal, 30)
                                    .background(Capsule().fill(Color.appBlue))
                                Spacer()
                            }
                            Spacer()
                        }
//                        .frame(minHeight: 400)
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView(controller: CurrentViewController("menu"))
    }
}
