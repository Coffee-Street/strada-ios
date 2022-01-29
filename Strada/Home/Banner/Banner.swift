//
//  Banner.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

struct Banner : Identifiable {
    let id = UUID()
    
    let title: String
    let image: String
    let name: String
    let tags: [String]
}
