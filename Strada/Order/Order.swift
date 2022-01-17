//
//  Order.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/17.
//

import Foundation

struct OrderItem {
    var menu: Menu
    var menuOption: MenuOption
    var menuPersonalOption: MenuPersonalOption
    var count: Int
}

struct Order {
    var orderItems: [OrderItem]
}
