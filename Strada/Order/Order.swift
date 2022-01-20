//
//  Order.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/17.
//

import Foundation

struct OrderItem : Identifiable {
    let id = UUID()
    
    var menu: Menu
    var menuOption: MenuOption
    var menuPersonalOption: MenuPersonalOption
    var count: Int
}

struct Order : Identifiable {
    let id = UUID()
    
    var orderItems: [OrderItem]
    
    var createdAt: Date
    var updatedAt: Date
}
