//
//  FavoriteMenuView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct FavoriteMenuView : View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("즐겨찾는 메뉴")
                        .foregroundColor(.blue)
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Image(systemName: "multiply")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                }
                
                VStack {
                    FavoriteMenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1000),
                        menuCount: .constant(1),
                        isMenuSoldout: .constant(false)
                    )
                    FavoriteMenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1000),
                        menuCount: .constant(1),
                        isMenuSoldout: .constant(true))
                }
                
                Divider()
                
                HStack {
                    ForEach(["커피", "치", "에이드", "디저트", "브런치"], id: \.self) { category in
                        Text(category)
                    }
                }
                
                VStack {
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500),
                        menuState: .constant(.SOLD_OUT))
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500),
                        menuState: .constant(.COMING_SOON))
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                    MenuItemView(
                        menuName: .constant("메뉴 이름"),
                        menuPrice: .constant(1500))
                }
            }
            .padding()
        }
    }
}

struct FavoriteMenuView_Previews : PreviewProvider {
    static var previews: some View {
        FavoriteMenuView()
        
        FavoriteMenuView()
            .previewDevice("iPod touch (7th generation)")
    }
}
