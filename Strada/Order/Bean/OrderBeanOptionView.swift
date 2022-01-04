//
//  OrderBeanOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct OrderBeanOptionView : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                OrderDetailOptionGroupView(options: [
                    OrderDetailOption(imageName: "bean", title: "원두"),
                    OrderDetailOption(imageName: "coarsely", title: "굵게"),
                    OrderDetailOption(imageName: "plain", title: "보통"),
                    OrderDetailOption(imageName: "finely", title: "곱게")
                ])
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

struct OrderBeaanOptionView_Previews : PreviewProvider {
    static var previews: some View {
        OrderBeanOptionView()
    }
}
