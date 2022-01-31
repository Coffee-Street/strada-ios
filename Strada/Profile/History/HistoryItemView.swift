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
                Text(history.point)
                    .foregroundColor(.appBlue)
                    .fontWeight(.regular)
                Text(history.date)
                    .foregroundColor(.appBrownGray)
                    .fontWeight(.medium)
            }
            
            
            Spacer()
            
            Image("next.active")
        }
    }
}
