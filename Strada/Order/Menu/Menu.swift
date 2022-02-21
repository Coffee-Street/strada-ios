//
//  MenuViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/17.
//

import Foundation

enum MenuState : Int {
    case AVAILABLE = 1
    case SOLD_OUT
    case COMING_SOON
}

enum MenuType {
    case COFFEE
    case TEA
    case ADE
    case DESSERT
    case BRUNCH
}

struct MenuName {
    let kr: String
    let en: String
}

struct Menu : Identifiable {
    let id = UUID()
    
    let type: MenuType
    
    var state: MenuState
    var name: MenuName
    var price: Int
}

enum MenuTemperatureType {
    case COLD
    case HOT
}

enum MenuCupSizeType {
    case REGULAR
    case TALL
    case GRANDE
}

enum MenuCupType {
    case DISPOSBLE
    case MULTI_USE
    case PERSONAL
}

class MenuOption {
    var menuType: MenuType
    
    init(menuType: MenuType) {
        self.menuType = menuType
    }
}

class DrinkMenuOption : MenuOption {
    var temperatureType: MenuTemperatureType
    var cupSizeType: MenuCupSizeType
    var cupType: MenuCupType
    
    init(menuType: MenuType, temperatureType: MenuTemperatureType, cupSizeType: MenuCupSizeType, cupType: MenuCupType) {
        self.temperatureType = temperatureType
        self.cupSizeType = cupSizeType
        self.cupType = cupType
        
        super.init(menuType: menuType)
    }
}

class MenuPersonalOption {
    var menuType: MenuType
    
    init(menuType: MenuType) {
        self.menuType = menuType
    }
}

class DrinkMenuPersonalOption : MenuPersonalOption {
    var shotCount: Int
    var syrupCount: [String:Int]
    var iceCount: Int
    var milkCount: Int
    var whippedCreamCount: Int
    var drizzleCount: Int
    
    init(menuType: MenuType, shotCount: Int, syrupCount: [String:Int], iceCount: Int, milkCount: Int, whippedCreamCount: Int, drizzleCount: Int) {
        self.shotCount = shotCount
        self.syrupCount = syrupCount
        self.iceCount = iceCount
        self.milkCount = milkCount
        self.whippedCreamCount = whippedCreamCount
        self.drizzleCount = drizzleCount
        
        super.init(menuType: menuType)
    }
}
