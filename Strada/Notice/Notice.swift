//
//  Notice.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/07.
//

import Foundation

enum NoticeType {
    case EVENT
    case ORDER
}

struct Notice : Identifiable {
    let id = UUID()
    
    let type: NoticeType
    
    let title: String
    let excerpt: String
    let date: String
    
    let read: Bool
    let detect: Bool
    
    init(type: NoticeType, title: String, excerpt: String, date: String, read: Bool, detect: Bool = true) {
        self.type = type
        self.title = title
        self.excerpt = excerpt
        self.date = date
        self.read = read
        self.detect = detect
    }
}
