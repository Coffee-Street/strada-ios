//
//  FavoriteMenuView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct FavoriteMenuView : View {
    
    @Binding var favoriteMenus: [FavoriteMenu]
    
    var body: some View {
        VStack {
            HStack {
                Text("즐겨찾는 메뉴")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 18, weight: .bold))
                Spacer()
            }
            
            VStack {
                ForEach(favoriteMenus.indices) { index in
                    FavoriteMenuItemView(favoriteMenu: $favoriteMenus[index])
                }
            }
        } // VStack
    }
}

struct FavoriteMenuView_Previews : PreviewProvider {
    @State static var favoriteMenus: [FavoriteMenu] = [
        FavoriteMenu(menu: Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0)),
        FavoriteMenu(menu: Menu(state: .AVAILABLE, name: "메뉴 이름", price: 2000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0))
    ]
    
    static var previews: some View {
        FavoriteMenuView(favoriteMenus: $favoriteMenus)
        
        FavoriteMenuView(favoriteMenus: $favoriteMenus)
            .previewDevice("iPod touch (7th generation)")
    }
}
