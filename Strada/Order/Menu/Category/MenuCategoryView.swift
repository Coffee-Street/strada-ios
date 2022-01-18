//
//  MenuCategoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/16.
//

import SwiftUI

struct MenuCategoryView : View {
    @Binding var categories: [String]
    
    @Binding var selected: String
    
    init(categories: Binding<[String]>, selected: Binding<String>) {
        _categories = categories
        _selected = selected
    }
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    self.selected = category
                }) {
                    Text(category)
                        .padding(.trailing, 15)
                        .foregroundColor(self.selected == category ? .appBlue : .appBrownGray)
                }
            }
        }
    }
}

struct MenuCategoryView_Previews : PreviewProvider {
    @State static var categories = ["커피", "차", "에이드", "디저트", "브런치"]
    @State static var selected = "커피"
    static var previews: some View {
        MenuCategoryView(categories: $categories, selected: $selected)
    }
}
