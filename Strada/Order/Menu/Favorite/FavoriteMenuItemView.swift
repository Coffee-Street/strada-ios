//
//  FavoriteMenuItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct FavoriteMenuItemView : View {
    
    @Binding var favoriteMenu: FavoriteMenu
    @State private var count: Int = 0
    
    init(favoriteMenu: Binding<FavoriteMenu>, count: Int = 0) {
        self._favoriteMenu = favoriteMenu
        _count = State(initialValue: count)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text(self.favoriteMenu.menu.name)
                    .foregroundColor(self.favoriteMenu.menu.state == .SOLD_OUT ? .appLightGray : .black)
                    .padding(.bottom, 5)
                Text("옵션 / 사이즈")
                    .foregroundColor(self.favoriteMenu.menu.state == .SOLD_OUT ? .appLightGray : .black)
                    .padding(.bottom, 5)
                Text("\(self.favoriteMenu.menu.price)원")
                    .foregroundColor(self.favoriteMenu.menu.state == .SOLD_OUT ? .appLightGray : .black)
                    .fontWeight(.semibold)
//                Text(menuPrice, format: .currency(code: "KRW"))
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if self.favoriteMenu.menu.state == .AVAILABLE {
                        MenuCountView()
                    } else if self.favoriteMenu.menu.state == .SOLD_OUT {
                        MenuSoldoutView()
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .frame(maxHeight: 96)
    }
}

struct FavoriteMenuItemView_Previews : PreviewProvider {
    @State static var favoriteMenu = FavoriteMenu(menu: Menu(type: .COFFEE, state: .AVAILABLE, name: "", price: 300), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(shotCount: 1, syrupCount: ["caramel": 1], iceCount: 1, milkCount: 2, whippedCreamCount: 0, drizzleCount: 0))
    static var previews: some View {
        FavoriteMenuItemView(favoriteMenu: $favoriteMenu)
    }
}
