//
//  Receipt.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/03.
//

import Foundation

enum ReceiptStatus: Int {
    case ACCEPT_WAIT
    case UNACCEPTED
    case MANUFACTURE_WAIT
    case MANUFACTURING
    case PICK_UP_WAIT
    case PICKED_UP
}

struct Receipt : Identifiable {
    let id: String
    
    let status: ReceiptStatus
    
    let createdAt: Date
    let respondTo: Date
    let doneOn: Date
    
    let orderItems: [String]
//    let order: Order
}
