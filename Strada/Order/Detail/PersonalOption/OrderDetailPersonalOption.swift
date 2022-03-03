//
//  OrderDetailPersonalOption.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/23.
//

import Foundation

enum OrderDetailPersonalOptionType {
    case COUNT
    case RANGE
}

struct OrderDetailPersonalOption {
    let type: OrderDetailPersonalOptionType
    let image: String
    let title: String
    let price: Int
    let range: [String]
    let index: Int
    
    init(image: String, title: String, price: Int, count: Int) {
        self.type = .COUNT
        self.image = image
        self.title = title
        self.price = price
        self.range = (0..<count).map { "\($0)" }
        self.index = 0
    }
    
    init(image: String, title: String, price: Int, range: [String], index: Int) {
        self.type = .RANGE
        self.image = image
        self.title = title
        self.price = price
        self.range = range
        self.index = index
    }
}
