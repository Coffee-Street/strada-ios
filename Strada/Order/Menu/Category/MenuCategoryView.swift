//
//  MenuCategoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/16.
//

import SwiftUI

struct MenuCategoryView : View {
    let categories: [String]
    
    @State var index = 0
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    self.index = categories.firstIndex(of: category) ?? 0
                }) {
                    Text(category)
                        .padding(.trailing, 15)
                        .foregroundColor(.appBrownGray)
                }
            }
        }
    }
}

struct MenuCategoryView_Previews : PreviewProvider {
    static let categories = ["커피", "차", "에이드", "디저트", "브런치"]
    static var previews: some View {
        MenuCategoryView(categories: categories)
    }
}
