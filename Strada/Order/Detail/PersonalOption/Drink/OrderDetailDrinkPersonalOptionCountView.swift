//
//  OrderDetailDrinkPersonalOptionCountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/02.
//

import SwiftUI

struct OrderDetailDrinkPersonalOptionCountView : View {
    
    @Binding var personalOption: OrderDetailPersonalOption
    
    @State private var value: Int = 0
    
    var body: some View {
        HStack {
            Image(personalOption.image)
            VStack(alignment: .leading) {
                Text(personalOption.title)
                    .padding(.bottom, 1)
                Text(personalOption.price == 0 ? "무료" : "\(personalOption.price)원")
                    .fontWeight(.bold)
            }
            Spacer()
            CountView(count: personalOption.range.count, index: .constant(value))
        }
    }
}

struct OrderDetailDrinkPersonalOptionCountView_Previews : PreviewProvider {
    @State static var personalOption = OrderDetailPersonalOption(image: "shot.active", title: "샷", price: 300, count: 4)
    static var previews: some View {
        OrderDetailDrinkPersonalOptionCountView(personalOption: $personalOption)
    }
}
