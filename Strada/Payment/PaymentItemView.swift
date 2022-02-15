//
//  PaymentItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/21.
//

import SwiftUI

struct PaymentItemView : View {
    @Binding var paymentItemViewModel: PaymentItemViewModel
    
    @State private var isAvailableCancel: Bool = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(paymentItemViewModel.orderItem.menu.name.kr)
                    .foregroundColor(.white)
                Text("옵션 / 사이즈")
                    .foregroundColor(.white)
                Text("\(paymentItemViewModel.orderItem.menu.price)원")
                    .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isAvailableCancel = false
                    }) {
                        Image("close.small")
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    CountView(count: 9, index: $paymentItemViewModel.count)
                        .background(Capsule().stroke(.white, lineWidth: 2))
                }
            }
        }
        .background(Color.appBlue)
    }
    
}
struct OrderItemView_Previews : PreviewProvider {
    @State static var paymentItemViewModel = PaymentItemViewModel()
    
    static var previews: some View {
        PaymentItemView(paymentItemViewModel: $paymentItemViewModel)
    }
}
