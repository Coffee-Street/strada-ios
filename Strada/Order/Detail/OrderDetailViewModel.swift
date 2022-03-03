//
//  OrderDetailViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/10.
//

import Foundation

class OrderDetailViewModel : ObservableObject {
    @Published var menu: Menu = Menu(
        type: .COFFEE,
        state: .AVAILABLE,
        name: MenuName(
            kr: "아메리카노",
            en: "Americano"
        ),
        price: 4000
    )
    
    @Published var options: [OrderDetailOption] = [
        OrderDetailOption(items: [
            OrderDetailOptionItem(imageName: "cold", title: "차갑게"),
            OrderDetailOptionItem(imageName: "hot", title: "뜨겁게")
        ]),
        OrderDetailOption(items: [
            OrderDetailOptionItem(imageName: "regular", title: "레귤러"),
            OrderDetailOptionItem(imageName: "tall", title: "톨"),
            OrderDetailOptionItem(imageName: "grande", title: "그란데")
        ]),
        OrderDetailOption(items: [
            OrderDetailOptionItem(imageName: "disposable", title: "일회용컵"),
            OrderDetailOptionItem(imageName: "multiuse", title: "매장용컵"),
            OrderDetailOptionItem(imageName: "personal", title: "개인컵")
        ])
    ]
//   = [
//        OrderDetailOption(items: [
//            OrderDetailOptionItem(imageName: "bean", title: "원두"),
//            OrderDetailOptionItem(imageName: "coarsely", title: "굵게"),
//            OrderDetailOptionItem(imageName: "plain", title: "보통"),
//            OrderDetailOptionItem(imageName: "finely", title: "곱게")
//        ])
//    ]
    
    @Published var personalOptions: [OrderDetailPersonalOption] = [
        OrderDetailPersonalOption(image: "shot.active", title: "샷", price: 300, count: 4),
        OrderDetailPersonalOption(image: "syrup.active", title: "헤이즐넛 시럽", price: 300, count: 4),
        OrderDetailPersonalOption(image: "ice.active", title: "얼음", price: 0, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "milk.active", title: "우유 추가", price: 300, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "whipped.active", title: "휘핑크림", price: 300, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "whipped.active", title: "휘핑크림", price: 300, range: ["안함","조금","보통","많이"], index: 0),
    ]
    
    @Published var hashTags: [String] = ["산미", "브라질", "단맛"]
//    = ["풋사과", "신맛", "콜롬비아"]
    
    let detailContent = "합리적 가격에 단맛과 산미가 조화롭습니다.\n생산지 : 브라질 세하도 모지아나\n등급 : 없음 | 품종 : 옐로우카투아이\n가공 : Natural | 로스팅 : 시티"
    
    func isOrderable() -> Bool {
        
        var selectedCount = 0
        
        for option in options {
            for item in option.items {
                if item.isSelected {
                    selectedCount += 1
                    break
                }
            }
        }
        
        return options.count == selectedCount
    }
    
    func getMenu(menu_id: Int) {
        // API request
    }
    
    func getMenuOptions(menu_id: Int) {
        // API request
    }
}
