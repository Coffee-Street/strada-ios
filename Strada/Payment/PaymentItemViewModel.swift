//
//  PaymentItemViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/15.
//

import Foundation

class PaymentItemViewModel : ObservableObject {
    @Published var orderItem: OrderItem
    @Published var count: Int
    
    init(orderItem: OrderItem, count: Int) {
        self.orderItem = orderItem
        self.count = count
    }
}
