//
//  PaymentViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/14.
//

import Foundation

class PaymentViewModel : ObservableObject {
    @Published var order: Order = Order(orderItems: [
        OrderItem(
            menu: Menu(type: MenuType.COFFEE, state: MenuState.AVAILABLE, name: MenuName(kr: "아메리카노", en: "Americano"), price: 4000),
            menuOption: MenuOption(menuType: .COFFEE),
            menuPersonalOption: MenuPersonalOption(menuType: .COFFEE),
            count: 3),
        OrderItem(
            menu: Menu(type: MenuType.COFFEE, state: MenuState.AVAILABLE, name: MenuName(kr: "아메리카노", en: "Americano"), price: 4000),
            menuOption: MenuOption(menuType: .COFFEE),
            menuPersonalOption: MenuPersonalOption(menuType: .COFFEE),
            count: 3)], createdAt: Date.now, updatedAt: Date.now)
    
    @Published var usePoint: Int = 0
    @Published var availablePoint: Int = 0
    
    func getTotalCount() -> Int {
        return order.orderItems.count
    }
    
    func getTotalPrice() -> Int {
        return order.orderItems.map { $0.menu.price * $0.count }.reduce(0, +)
    }
}
