//
//  PaymentFailView.swift
//  Strada
//
//  Created by 박종봉 on 2022/05/02.
//

import SwiftUI

struct PaymentFailView : View {
    @ObservedObject var controller: CurrentViewController
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                Text("주문이 실패했습니다.")
                    .foregroundColor(.appTextPrimary)
                    .font(.system(size: 24, weight: .medium))
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    controller.goPaymentFail()
                }) {
                    HStack {
                        Spacer()
                        Text("돌아가기")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(height: 96)
                    .background(Color.appPrimary)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PaymentFailView_Previews : PreviewProvider {
    static var previews: some View {
        PaymentFailView(controller: CurrentViewController("paymentFail"))
    }
}
