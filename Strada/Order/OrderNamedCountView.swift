//
//  OrderNamedCountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct OrderNamedCountView : View {
    var body: some View {
        HStack {
            CountView(range: ["안함", "적게","보통", "많이"], index: 1)
        }
    }
}

struct OrderNamedCountView_Previews : PreviewProvider {
    static var previews: some View {
        OrderNamedCountView()
    }
}
