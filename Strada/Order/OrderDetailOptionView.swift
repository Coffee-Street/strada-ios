//
//  OrderOptionIconButtonView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionView : View {
    let option: OrderDetailOption
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(isActive ? "\(option.imageName).active" : option.imageName)
                .font(.system(size: 20))
                .padding(.horizontal)
            Text(option.title)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(isActive ? .appBlue : .appLightGray)
                .padding(.horizontal)
        }
    }
}

struct OrderOptionIconButtonView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailOptionView(option: OrderDetailOption(imageName: "regular", title: "레귤러"))
    }
}
