//
//  PaymentItemViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/15.
//

import Foundation

class PaymentItemViewModel : ObservableObject {
    @Published var orderItem: OrderItem = OrderItem(
        menu: Menu(type: MenuType.COFFEE, state: MenuState.AVAILABLE, name: MenuName(kr: "아메리카노", en: "Americano"), price: 4000),
        menuOption: MenuOption(menuType: .COFFEE),
        menuPersonalOption: MenuPersonalOption(menuType: .COFFEE),
        count: 3)
    
    @Published var count: Int = 1
    
    @Published var isCancellable: Bool = true
}
