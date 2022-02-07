//
//  NoticeViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/07.
//

import Foundation

class NoticeViewModel : ObservableObject {
    
    @Published var categories: [String] = ["전체", "이벤트", "주문"]
    
    @Published var selectedCategory: String = ""
    
    @Published var notices: [Notice] = [
        Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: false, detect: false),
        Notice(type: NoticeType.EVENT, title: "에그마요와 아메리카노 이벤트", excerpt: "아메리카노 \(1000)원 할인", date: "2020.10.17", read: false),
        Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: false),
        Notice(type: NoticeType.ORDER, title: "주문이 취소되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: false),
        Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: true),
        Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: true),
        Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: true),
    ]
    
    func getNotices(category: String) -> [Notice] {
        if category == "이벤트" {
            return self.notices.filter { notice in
                notice.type == NoticeType.EVENT
            }
        } else if category == "주문" {
            return self.notices.filter { notice in
                notice.type == NoticeType.ORDER
            }
        } else {
            return self.notices
        }
    }
}
