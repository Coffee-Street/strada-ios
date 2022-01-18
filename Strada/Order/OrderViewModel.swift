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
    
    @Published var menus = [
        "커피": [
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .SOLD_OUT, name: "메뉴 이름", price: 1500),
            Menu(state: .COMING_SOON, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
        ],
        "차": [
            
        ],
        "에이드": [
        ],
        "디저트": [
        ],
        "브런치": [
        ]
    ]
    
    @Published var categories: [String] = [
        "커피",
        "차",
        "에이드",
        "디저트",
        "브런치"
    ]
    
    init() {
        
    }
    
    func getFavoriteMenus() {
        // Network
        
        
    }
    
    func getMenus() {
        // Network
        
        
    }
}
