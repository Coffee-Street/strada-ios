//
//  HistoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct HistoryView : View {
    var body: some View {
        VStack {
            HistoryItemView()
                .padding(10)
            HistoryItemView()
                .padding(10)
            HistoryItemView()
                .padding(10)
            HistoryItemView()
                .padding(10)
        }
    }
}

struct HistoryView_Previews : PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
