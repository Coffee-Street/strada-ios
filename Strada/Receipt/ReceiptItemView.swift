//
//  ReceiptItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/05/04.
//

import SwiftUI

struct ReceiptItemView : View {
    
//    @Binding var orderItem: OrderItem
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("메뉴 이름")
                Spacer()
                Text("2개")
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(height: 26)
            .padding(.bottom, 2)
            HStack(spacing: 0) {
                Text("옵션 / 사이즈")
                Spacer()
                Text("\(4000)원")
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(height: 26)
        }
    }
}

struct ReceiptItemView_Previews : PreviewProvider {
    static var previews: some View {
        ReceiptItemView()
//        ReceiptItemView(orderItem: OrderItem(menu: <#T##Menu#>, menuOption: <#T##MenuOption#>, menuPersonalOption: <#T##MenuPersonalOption#>, count: <#T##Int#>))
    }
}
