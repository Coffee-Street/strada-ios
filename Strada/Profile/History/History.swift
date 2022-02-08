//
//  History.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import Foundation

enum HistoryType : Codable {
    case REWARD
    case REDEEM
    case CANCEL
}

struct History : Identifiable {
    let id: Int

    let type: HistoryType
    
    let title: String
    let point: Int
    let date: String
    
//    var order: Order
}
