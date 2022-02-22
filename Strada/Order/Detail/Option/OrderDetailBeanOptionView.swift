//
//  OrderDetailBeanOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct OrderDetailBeanOptionView : View {
    
    @Binding var option: OrderDetailOption
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                OrderDetailOptionView(option: $option)
            }
            
            Divider()
                .padding()
            
            VStack {
                Text("그라인딩 굵기 선택 TIP\n* 프렌치브레스 / 콜드브루 - 굵게\n* 드립 - 보통\n* 모카포트 / 사이폰 - 곱게")
            }
        }
        .padding()
    }
}

struct OrderDetailBeanOptionView_Previews : PreviewProvider {
    @State static var option = OrderDetailOption(items: [
        OrderDetailOptionItem(imageName: "bean", title: "원두"),
        OrderDetailOptionItem(imageName: "coarsely", title: "굵게"),
        OrderDetailOptionItem(imageName: "plain", title: "보통"),
        OrderDetailOptionItem(imageName: "finely", title: "곱게")
    ])
    
    static var previews: some View {
        OrderDetailBeanOptionView(option: $option)
    }
}
