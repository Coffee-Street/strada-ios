//
//  HistoryViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/08.
//

import Foundation

class HistoryViewModel : ObservableObject {
    
    @Published var categories: [String] = ["전체", "적립", "사용", "취소"]
    
    @Published var selectedCategory: String = ""
    
    @Published var histories: [History] = [
        History(id: 1, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 2, type: HistoryType.REDEEM, title: "아메리카노 외 3개 메뉴", point: -5500, date: "2020.10.17"),
        History(id: 3, type: HistoryType.REDEEM, title: "아메리카노 외 3개 메뉴", point: -500, date: "2020.10.17"),
        History(id: 4, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 5, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 6, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 7, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 8, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 9, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 10, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
        History(id: 11, type: HistoryType.REWARD, title: "아메리카노 외 3개 메뉴", point: 500, date: "2020.10.17"),
    ]
    
    func getHistories(category: String) -> [History] {
        if category == "적립" {
            return self.histories.filter { notice in
                notice.type == HistoryType.REWARD
            }
        } else if category == "사용" {
            return self.histories.filter { notice in
                notice.type == HistoryType.REDEEM
            }
        } else if category == "취소" {
            return self.histories.filter { notice in
                notice.type == HistoryType.CANCEL
            }
        } else {
            return self.histories
        }
    }
}
