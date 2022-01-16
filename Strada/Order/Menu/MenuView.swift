//
//  MenuView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/15.
//

import SwiftUI

struct MenuView : View {
    
    let menuCategories = ["커피", "차", "에이드", "디저트", "브런치"]
    @State private var index = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MenuCategoryView(categories: menuCategories)
            .padding(.bottom, 35)
            
            VStack {
                NavigationLink(destination: OrderDetailView()) {
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                }
                
                MenuItemView(
                    menuName: .constant("메뉴 이름"),
                    menuPrice: .constant(1500),
                    menuState: .constant(.SOLD_OUT))
                MenuItemView(
                    menuName: .constant("메뉴 이름"),
                    menuPrice: .constant(1500),
                    menuState: .constant(.COMING_SOON))
                
                NavigationLink(destination: OrderDetailView()) {
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                }
                
                NavigationLink(destination: OrderDetailView()) {
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                }
                
                NavigationLink(destination: OrderDetailView()) {
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                }
            }
        }
    }
}

struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
