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
    case NON_COFFEE
    case BREAD
    case BEAN
}

class Menu : Identifiable {
    let id = UUID()
    
    var state: MenuState
    var name: String
    var price: Int
    
    init(state: MenuState, name: String, price: Int) {
        self.state = state
        self.name = name
        self.price = price
    }
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
    
    init(shotCount: Int, syrupCount: [String:Int], iceCount: Int, milkCount: Int, whippedCreamCount: Int, drizzleCount: Int) {
        self.shotCount = shotCount
        self.syrupCount = syrupCount
        self.iceCount = iceCount
        self.milkCount = milkCount
        self.whippedCreamCount = whippedCreamCount
        self.drizzleCount = drizzleCount
        
        super.init(menuType: .COFFEE)
    }
}
