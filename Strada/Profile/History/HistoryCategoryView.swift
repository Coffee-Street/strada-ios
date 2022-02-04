//
//  HistoryCategoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import SwiftUI

struct HistoryCategoryView : View {
    @Binding var categories: [String]
    
    @Binding var selected: String
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    self.selected = category
                }) {
                    Text(category)
                        .padding(.trailing, 24)
                        .foregroundColor(self.selected == category ? .appBlue : .appBrownGray)
                        .font(.system(size: 17, weight: self.selected == category ? .bold : .medium))
                }
            }
        }
    }
}