//
//  PaymentItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/21.
//

import SwiftUI

struct PaymentItemView : View {
    @Binding var viewModel: PaymentItemViewModel
    
    let onDelete: () -> ()
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(viewModel.orderItem.menu.name.kr)
                    .foregroundColor(.white)
                Text("옵션 / 사이즈")
                    .foregroundColor(.white)
                Text("\(viewModel.orderItem.menu.price)원")
                    .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: onDelete) {
                        Image("close.small")
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    CountView(count: 9, index: $viewModel.count)
                        .background(Capsule().stroke(.white, lineWidth: 2))
                }
            }
        }
        .background(Color.appBlue)
    }
}
struct OrderItemView_Previews : PreviewProvider {
    @State static var viewModel = PaymentItemViewModel()

    static var previews: some View {
        PaymentItemView(viewModel: $viewModel, onDelete: {})
    }
}
