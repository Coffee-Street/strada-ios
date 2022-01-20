//
//  ProfileViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published var categories: [String] = ["전체", "적립", "사용", "취소"]
    
    @Published var histories: [String:[History]] = [
        "전체": [
            History(title: "아메리카노 외 3개 메뉴", point: "+\(500)P", date: "2020.10.17"),
            History(title: "아메리카노 외 3개 메뉴", point: "+\(500)P", date: "2020.10.17"),
            History(title: "아메리카노 외 3개 메뉴", point: "+\(500)P", date: "2020.10.17"),
            History(title: "아메리카노 외 3개 메뉴", point: "+\(500)P", date: "2020.10.17")
        ],
        "적립": [],
        "사용": [],
        "취소": []
    ]
    
    init() {
        
    }
}
