//
//  PaymentSuccessView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/22.
//

import SwiftUI

struct PaymentSuccessView : View {
    @ObservedObject var controller: CurrentViewController
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                Text("주문이 성공적으로\n완료되었습니다")
                    .font(.system(size: 24, weight: .medium))
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    controller.goHome()
                }) {
                    HStack {
                        Spacer()
                        Text("홈으로")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(height: 96)
                    .background(Color.appBlue)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.white)
    }
}

struct PaymentSuccessView_Previews : PreviewProvider {
    static var previews: some View {
        PaymentSuccessView(controller: CurrentViewController("paymentSuccess"))
    }
}
