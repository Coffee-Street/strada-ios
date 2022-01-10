//
//  OrderDrinkPersonalOptionRangeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/02.
//

import SwiftUI

struct OrderDrinkPersonalOptionRangeView : View {
    
    let image: String
    let title: String
    let price: String
    let range: [String]
    let index: Int
    
    var body: some View {
        HStack {
            Image(image)
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.bottom, 1)
                Text(price)
                    .fontWeight(.bold)
            }
            Spacer()
            CountView(range: range, index: index)
        }
    }
}

struct OrderDrinkPersonalOptionRangeView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDrinkPersonalOptionRangeView(image: "shot.active", title: "샷", price: "300원", range: ["안함","조금","보통","많이"], index: 0)
    }
}
