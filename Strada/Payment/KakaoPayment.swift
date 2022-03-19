//
//  KakaoPayment.swift
//  Strada
//
//  Created by 박종봉 on 2022/03/13.
//

import Foundation

struct KakaoPayment : Identifiable {
    let id = UUID()
    
    let tid: String
    let appUrl: String
    let mobileUrl: String
    let appScheme: String
    let createdAt: Date
}
