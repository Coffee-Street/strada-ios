//
//  PaymentViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/14.
//

import Foundation

class PaymentViewModel : ObservableObject {
    @Published var usePoint: Int = 0
    @Published var availablePoint: Int = 0
    
    @Published var paymentItemViewModels: [PaymentItemViewModel] = [
        PaymentItemViewModel(
            orderItem: OrderItem(
                menu: Menu(
                    type: MenuType.COFFEE,
                    state: MenuState.AVAILABLE,
                    name: MenuName(
                        kr: "아메리카노",
                        en: "Americano"
                    ),
                    price: 4000
                ),
                menuOption: DrinkMenuOption(
                    menuType: .COFFEE,
                    temperatureType: MenuTemperatureType.COLD,
                    cupSizeType: MenuCupSizeType.GRANDE,
                    cupType: MenuCupType.DISPOSBLE
                ),
                menuPersonalOption: DrinkMenuPersonalOption(
                    menuType: .COFFEE,
                    shotCount: 1,
                    syrupCount: ["헤이즐넛": 1],
                    iceCount: 2,
                    milkCount: 0,
                    whippedCreamCount: 0,
                    drizzleCount: 0
                ),
                count: 1
            ),
            count: 1
        ),
        PaymentItemViewModel(
            orderItem: OrderItem(
                menu: Menu(
                    type: MenuType.COFFEE,
                    state: MenuState.AVAILABLE,
                    name: MenuName(
                        kr: "아메리카노",
                        en: "Americano"
                    ),
                    price: 4000
                ),
                menuOption: DrinkMenuOption(
                    menuType: .COFFEE,
                    temperatureType: MenuTemperatureType.COLD,
                    cupSizeType: MenuCupSizeType.GRANDE,
                    cupType: MenuCupType.DISPOSBLE
                ),
                menuPersonalOption: DrinkMenuPersonalOption(
                    menuType: .COFFEE,
                    shotCount: 1,
                    syrupCount: ["헤이즐넛": 1],
                    iceCount: 2,
                    milkCount: 0,
                    whippedCreamCount: 0,
                    drizzleCount: 0
                ),
                count: 1
            ),
            count: 1
        ),
    ]

    func getTotalCount() -> Int {
        return paymentItemViewModels.map { $0.count }.reduce(0, +)
    }
    
    func getTotalPrice() -> Int {
        return paymentItemViewModels.map { ( $0.orderItem.menu.price + 0 ) * $0.count }.reduce(0, +)
    }
}
