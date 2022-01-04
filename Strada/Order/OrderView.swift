//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct OrderView : View {
    let myColor = Color(red: 207/255, green: 207/255, blue: 207/255)
    let myBackgroundColor = Color(red: 238/255, green: 238/255, blue: 238/255)
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        
                    }){
                        Text("장바구니")
                            .foregroundColor(.secondary)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                
                    Button(action: {
                        
                    }){
                        Text("바로주문")
                            .foregroundColor(.secondary)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                }
    //            .padding(.bottom, 14)
                .background(myBackgroundColor)
            }
            .edgesIgnoringSafeArea(.bottom)
            
        } // ZStack
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView()
        
        OrderView()
            .previewDevice("iPod touch (7th generation)")
    }
}
