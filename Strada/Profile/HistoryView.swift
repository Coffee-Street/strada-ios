//
//  HistoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct HistoryView : View {
    
    @Binding var categories: [String]
    @Binding var histories: [String:[History]]
    
    @State private var selectedCategory: String
    
    init(categories: Binding<[String]>, histories: Binding<[String:[History]]>) {
        _categories = categories
        _histories = histories
        _selectedCategory = State(initialValue: _categories.first?.wrappedValue ?? "")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HistoryCategoryView(categories: $categories, selected: $selectedCategory)
                .padding(.bottom)
            
            if (histories[selectedCategory] != nil) {
                ScrollView {
                    ForEach(histories[selectedCategory]!) { history in
                        HistoryItemView(history: history)
                            .padding(.bottom)
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews : PreviewProvider {
    @State static var categories: [String] = ["전체", "적립", "사용", "취소"]
    @State static var histories = [
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
    
    @State static var selectedHistory: String = "전체"
    
    static var previews: some View {
        HistoryView(categories: $categories, histories: $histories)
    }
}
