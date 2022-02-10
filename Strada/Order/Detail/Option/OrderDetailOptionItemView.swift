//
//  OrderDetailOptionItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionItemView : View {
    @Binding var option: OrderDetailOptionItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(option.isSelected ? "\(option.imageName).active" : option.imageName)
                .font(.system(size: 20))
                .padding(.horizontal)
            Text(option.title)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(option.isSelected ? .appBlue : .appLightGray)
                .padding(.horizontal)
        }
    }
}

struct OrderOptionItemView_Previews : PreviewProvider {
    @State static var option = OrderDetailOptionItem(imageName: "regular", title: "레귤러")
    
    static var previews: some View {
        OrderDetailOptionItemView(option: $option)
    }
}
