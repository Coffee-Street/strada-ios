//
//  OrderDetailOptionView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionView : View {
    @Binding var option: OrderDetailOption
    
    var body: some View {
        HStack {
            ForEach(option.items.indices, id: \.self) { index in
                Button(action: {
                    for action_index in option.items.indices {
                        option.items[action_index].isSelected = action_index == index
                    }
                }) {
                    OrderDetailOptionItemView(option: $option.items[index])
                }
            }
        }
    }
}

struct OrderDetailOptionView_Previews : PreviewProvider {
    @State static var option = OrderDetailOption(items: [
        OrderDetailOptionItem(imageName: "cold", title: "차갑게"),
        OrderDetailOptionItem(imageName: "hot", title: "뜨겁게")
        ])
    
    static var previews: some View {
        OrderDetailOptionView(option: $option)
    }
}
