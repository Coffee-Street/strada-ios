//
//  HistoryItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct HistoryItemView : View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("아메리카노 외 3개 메뉴")
                    .fontWeight(.medium)
                Text("+\(500)P")
                    .foregroundColor(.appBlue)
                    .fontWeight(.regular)
                Text("2020.10.17")
                    .foregroundColor(.appBrownGray)
                    .fontWeight(.medium)
            }
            
            
            Spacer()
            
            Image("next.active")
        }
    }
}
