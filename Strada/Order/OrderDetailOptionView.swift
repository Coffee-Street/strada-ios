//
//  OrderOptionIconButtonView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionView : View {
    
    let option: OrderDetailOption
    
    let myColor = Color(red: 207/255, green: 207/255, blue: 207/255)
    
    var body: some View {
        VStack {
            Image(option.imageName)
                .font(.system(size: 20))
                .foregroundColor(myColor)
                .padding(.horizontal)
            Text(option.title)
                .font(.system(size: 13))
                .foregroundColor(myColor)
                .padding(.horizontal)
        }
        .padding()
    }
}

struct OrderOptionIconButtonView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailOptionView(OrderDetailOption(imageName: "regular", title: "레귤러"))
    }
}
