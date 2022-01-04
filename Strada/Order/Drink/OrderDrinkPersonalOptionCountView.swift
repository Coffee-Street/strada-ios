//
//  OrderDrinkPersonalOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/02.
//

import SwiftUI

struct OrderDrinkPersonalOptionCountView : View {
    
    let image: String
    let title: String
    let price: String
    let count: Int
    
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
            CountView(count: count)
        }
    }
}

struct OrderDrinkPersonalOptionCountView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDrinkPersonalOptionCountView(image: "shot.active", title: "샷", price: "300원", count: 4)
    }
}
