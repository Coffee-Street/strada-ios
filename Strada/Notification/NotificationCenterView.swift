//
//  NotificationCenterView.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/06.
//

import SwiftUI

struct NotificationCenterView : View {
    
    @Binding var isOpened: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("알림 센터")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isOpened = false
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 30))
                    }
                }
                Spacer()
            } // VStack
            .padding()
        } // ZStack
    }
}

struct NotificationCenterView_Previews : PreviewProvider {
    static var previews: some View {
        NotificationCenterView(isOpened: .constant(false))
    }
}
