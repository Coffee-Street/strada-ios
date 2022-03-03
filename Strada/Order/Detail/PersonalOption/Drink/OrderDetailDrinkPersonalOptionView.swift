//
//  OrderDetailDrinkPersonalOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/23.
//

import SwiftUI

struct OrderDetailDrinkPersonalOptionView : View {
    
    @Binding var personalOptions: [OrderDetailPersonalOption]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("퍼스널 옵션을 사용해보세요")
                            .padding(.bottom, 30)
                        
                        ForEach(personalOptions.indices, id: \.self) { index in
                            switch personalOptions[index].type {
                            case .COUNT:
                                OrderDetailDrinkPersonalOptionCountView(personalOption: $personalOptions[index])
                                    .padding(.bottom)
                            case .RANGE:
                                OrderDetailDrinkPersonalOptionRangeView(personalOption: $personalOptions[index])
                                    .padding(.bottom)
                            }
                        }
                    }
            } // VStack
        }
    }
}

struct OrderDetailDrinkPersonalOptionView_Previews : PreviewProvider {
    @State static var personalOptions = [
        OrderDetailPersonalOption(image: "shot.active", title: "샷", price: 300, count: 4),
        OrderDetailPersonalOption(image: "syrup.active", title: "헤이즐넛 시럽", price: 300, count: 4),
        OrderDetailPersonalOption(image: "ice.active", title: "얼음", price: 0, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "milk.active", title: "우유 추가", price: 300, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "whipped.active", title: "휘핑크림", price: 300, range: ["안함","조금","보통","많이"], index: 0),
        OrderDetailPersonalOption(image: "drizzle.active", title: "드리즐", price: 300, range: ["안함","조금","보통","많이"], index: 0),
    ]
    
    static var previews: some View {
        OrderDetailDrinkPersonalOptionView(personalOptions: $personalOptions)
        OrderDetailDrinkPersonalOptionView(personalOptions: $personalOptions)
            .previewDevice("iPhone 8")
            
    }
}
