//
//  OrderDetailDrinkPersonalOptionRangeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/02.
//

import SwiftUI

struct OrderDetailDrinkPersonalOptionRangeView : View {
    
    @Binding var personalOption: OrderDetailPersonalOption
    
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
            CountView(range: personalOption.range, index: .constant(personalOption.index))
        }
    }
}

struct OrderDetailDrinkPersonalOptionRangeView_Previews : PreviewProvider {
    @State static var personalOption = OrderDetailPersonalOption(image: "shot.active", title: "샷", price: 300, range: ["안함","조금","보통","많이"], index: 3)
    static var previews: some View {
        OrderDetailDrinkPersonalOptionRangeView(personalOption: $personalOption)
    }
}
