//
//  CategoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/07.
//

import SwiftUI

struct CategoryView : View {
    
    let categories: [String]
    
    @Binding var selected: String
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    self.selected = category
                }) {
                    Text(category)
                        .padding(.trailing, 20)
                        .foregroundColor(getFontColor(selected: category))
                        .font(.system(size: 17, weight: getFontWeight(selected: category)))
                }
            }
        }
    }
    
    func getFontColor(selected: String) -> Color {
        return self.selected == selected ? .appBlue : .appBrownGray
    }
    
    func getFontWeight(selected: String) -> Font.Weight {
        return self.selected == selected ? .bold : .medium
    }
}

struct CategoryView_Previews : PreviewProvider {
    static let category = ["전체", "이벤트", "주문"]
    @State static var selected = category.first ?? ""
    static var previews: some View {
        CategoryView(categories: category, selected: $selected)
    }
}