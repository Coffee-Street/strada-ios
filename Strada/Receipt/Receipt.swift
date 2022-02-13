//
//  Receipt.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/03.
//

import Foundation

struct Receipt : Identifiable {
    let id: Int
    
    let status: Int
    
    let orderItems: [String]
}
