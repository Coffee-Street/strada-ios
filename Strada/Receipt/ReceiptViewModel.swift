//
//  ReceiptViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/25.
//

import Foundation

class ReceiptViewModel : ObservableObject
{
    @Published var order: Order
    
//    @Published var store: Store
    
    @Published var payment: Payment
    
    init()
    {
        order = Order(
            name: "A-99",
            state: OrderState.COMPLETE,
            orderItems: [
            ],
            createdAt: Date.now,
            updatedAt: Date.now
        )
        
        payment = Payment()
    }
}
