//
//  OrderOptionIconButtonGroupView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/31.
//

import SwiftUI

struct OrderDetailOptionGroupView : View {
    
    let orderDetailOptions: [OrderDetailOption]
    
    var body: some View {
        HStack {
            ForEach(orderOptions, id: \.self) { orderOption in
            }
        }
    }
}

struct OrderOptionIconButtonGroupView_Previews : PreviewProvider {
    static var previews: some View {
        OrderOptionIconButtonGroupView()
    }
}
