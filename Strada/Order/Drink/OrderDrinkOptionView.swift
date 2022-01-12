//
//  OrderOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/23.
//

import SwiftUI

struct OrderDrinkOptionView : View {

    @Binding var isComplete: Bool
    
    @State private var orderDetailOptionsCategories: [[OrderDetailOption]] = [
        [
            OrderDetailOption(imageName: "cold", title: "차갑게"),
            OrderDetailOption(imageName: "hot", title: "뜨겁게")
        ],
        [
            OrderDetailOption(imageName: "regular", title: "레귤러"),
            OrderDetailOption(imageName: "tall", title: "톨"),
            OrderDetailOption(imageName: "grande", title: "그란데")
        ],
        [
            OrderDetailOption(imageName: "disposable", title: "일회용컵"),
            OrderDetailOption(imageName: "multiuse", title: "매장용컵"),
            OrderDetailOption(imageName: "personal", title: "개인컵")
        ]
    ]
    
    func checkComplete() {
        for orderDetailOptions in orderDetailOptionsCategories {
            var isChecked = false
            
            for orderDetailOption in orderDetailOptions {
                if orderDetailOption.isSelected == true {
                    isChecked = true
                    break
                }
            }
            
            if isChecked == false {
                self.isComplete = false
                break
            }
        }
        
        self.isComplete = true
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(orderDetailOptionsCategories.indices) { index in
                            OrderDetailOptionGroupView(options: orderDetailOptionsCategories[index])
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
                }
            }
        }
    }
}

struct OrderDrinkOptionView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDrinkOptionView(isComplete: .constant(false))
        OrderDrinkOptionView(isComplete: .constant(false))
            .previewDevice("iPhone 8")
            
    }
}
