//
//  HistoryItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct HistoryItemView : View {
    let history: History
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(history.title)
                    .fontWeight(.medium)
                Text("\(history.point > 0 ? "+" : "")\(history.point)P")
                    .foregroundColor(getPointFontColor())
                    .fontWeight(.regular)
                    .padding(.bottom, 4)
                Text(history.date)
                    .foregroundColor(.appBrownGray)
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            Image("next.active")
        }
    }
    
    func getPointFontColor() -> Color {
        return history.point > 0 ? .appBlue : history.point < 0 ? .appOrange : .appBlack
    }
}

struct HistoryItemView_Previews : PreviewProvider {
    static var previews: some View {
        HistoryItemView(history: History(id: 1, type: HistoryType.REWARD, title: "hello", point: 100000000, date: "2022.04.29"))
    }
}
