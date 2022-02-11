//
//  OrderOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/23.
//

import SwiftUI

struct OrderDrinkOptionView : View {
    
    @Binding var options: [OrderDetailOption]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(options.indices, id: \.self) { index in
                            OrderDetailOptionView(option: $options[index])
                        }
                    } // VStack
                    
                    Divider()
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("퍼스널 옵션을 사용해보세요")
                            .padding(.bottom, 30)
                        
                        OrderDrinkPersonalOptionCountView(image: "shot.active", title: "샷", price: "300원", count: 4)
                        .padding(.bottom)
                        
                        OrderDrinkPersonalOptionCountView(image: "syrup.active", title: "헤이즐넛 시럽", price: "300원", count: 4)
                        .padding(.bottom)
                        
                        OrderDrinkPersonalOptionRangeView(image: "ice.active", title: "얼음", price: "무료", range: ["안함","조금","보통","많이"], index: 0)
                        .padding(.bottom)

                        OrderDrinkPersonalOptionRangeView(image: "milk.active", title: "우유 추가", price: "300원", range: ["안함","조금","보통","많이"], index: 0)
                        .padding(.bottom)
                        
                        OrderDrinkPersonalOptionRangeView(image: "whipped.active", title: "휘핑크림", price: "300원", range: ["안함","조금","보통","많이"], index: 0)
                        .padding(.bottom)
                        
                        OrderDrinkPersonalOptionRangeView(image: "drizzle.active", title: "드리즐", price: "300원", range: ["안함","조금","보통","많이"], index: 0)
                    }
                    .padding()
                } // VStack
            } // VStack
        }
    }
}

struct OrderDrinkOptionView_Previews : PreviewProvider {
    @State static var options = [
        OrderDetailOption(items: []),
        OrderDetailOption(items: []),
        OrderDetailOption(items: []),
    ]
    
    static var previews: some View {
        OrderDrinkOptionView(options: $options)
        OrderDrinkOptionView(options: $options)
            .previewDevice("iPhone 8")
            
    }
}
