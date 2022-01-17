//
//  OrderViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/17.
//

import Foundation

class OrderViewModel : ObservableObject {
    
    @Published var favoriteMenus: [FavoriteMenu] = [
        FavoriteMenu(menu: Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0)),
        FavoriteMenu(menu: Menu(state: .AVAILABLE, name: "메뉴 이름", price: 2000), menuOption: DrinkMenuOption(menuType: .COFFEE, temperatureType: .COLD, cupSizeType: .GRANDE, cupType: .DISPOSBLE), menuPersonalOption: DrinkMenuPersonalOption(shotCount: 1, syrupCount: [:], iceCount: 1, milkCount: 0, whippedCreamCount: 0, drizzleCount: 0))]
    @Published var menus: [Menu] = []
    
    init() {
        
    }
    
    func getFavoriteMenus() {
        // Network
        
        
    }
    
    func getMenus() {
        // Network
        
        
    }
}
