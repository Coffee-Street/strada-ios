//
//  ProfileSummary.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/30.
//

import Foundation

struct ProfileSummary : Identifiable {
    let id = UUID()
    
    let phoneNumber: String
    let point: Int
}
