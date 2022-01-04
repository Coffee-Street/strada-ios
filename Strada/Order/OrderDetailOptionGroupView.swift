//
//  OrderOptionIconButtonGroupView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionGroupView : View {
    let options: [OrderDetailOption]
    
    @State private var selectedOption: Int = -1
    
    var body: some View {
        HStack {
            ForEach(options.indices) { index in
                
                Button(action: {

                    selectedOption = index
                }) {
                    OrderDetailOptionView(option: options[index])
                }
            }
        }
    }
}

struct OrderDetailOptionGroupView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailOptionGroupView(options: [OrderDetailOption(imageName: "cold", title: "차갑게"), OrderDetailOption(imageName: "hot", title: "뜨겁게")])
    }
}
