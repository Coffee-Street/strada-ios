//
//  MenuViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/08.
//

import Foundation

class MenuViewModel : ObservableObject {
    
    @Published var categories: [String] = [
        "커피",
        "차",
        "에이드",
        "디저트",
        "브런치"
    ]
    
    @Published var selectedCategory: String = ""
    
    @Published var menus = [
        Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
        Menu(type: .COFFEE, state: .SOLD_OUT, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
        Menu(type: .COFFEE, state: .COMING_SOON, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
        Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
        Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
        Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1500),
    ]
    
    @Published var favoriteMenus: [FavoriteMenu] = [
        FavoriteMenu(menu: Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 1000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(menuType: .COFFEE, shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0)),
        FavoriteMenu(menu: Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 2000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(menuType: .COFFEE, shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0))]
    
    func getMenusByCategory(selected: String) -> [Menu] {
        if selected == "커피" {
            return self.menus.filter { menu in
                menu.type == MenuType.COFFEE
            }
        } else if selected == "차" {
            return self.menus.filter { menu in
                menu.type == MenuType.TEA
            }
        } else if selected == "에이드" {
            return self.menus.filter { menu in
                menu.type == MenuType.ADE
            }
        } else if selected == "디저트" {
            return self.menus.filter { menu in
                menu.type == MenuType.DESSERT
            }
        } else if selected == "브런치" {
            return self.menus.filter { menu in
                menu.type == MenuType.BRUNCH
            }
        } else {
            return menus
        }
    }
    
    func getMenus() {
        // API request
    }
    
    func getFavoriteMenus() {
        // API request
    }
}
