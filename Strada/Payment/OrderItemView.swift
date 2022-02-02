//
//  OrderItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/21.
//

import SwiftUI

struct OrderItemView : View {
    
    @Binding var isAvailableCancel: Bool
    
    init(isAvailableCancel: Binding<Bool> = .constant(true)) {
        _isAvailableCancel = isAvailableCancel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("메뉴 이름")
                    .foregroundColor(.white)
                Text("옵션 / 사이즈")
                    .foregroundColor(.white)
                Text("\(4000)원")
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
                    CountView(count: 5, index: 1)
                        .background(Capsule().stroke(.white, lineWidth: 2))
                }
            }
        }
        .background(Color.appBlue)
    }
}

struct OrderItemView_Previews : PreviewProvider {
    static var previews: some View {
        OrderItemView()
    }
}
