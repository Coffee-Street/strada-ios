//
//  FavoriteMenu.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/17.
//

import Foundation

struct FavoriteMenu /*: Hashable*/ {
//    static func == (lhs: FavoriteMenu, rhs: FavoriteMenu) -> Bool {
//        return lhs.menu.name == rhs.menu.name
//    }
    
    var menu: Menu
    var menuOption: MenuOption
    var menuPersonalOption: MenuPersonalOption
}
