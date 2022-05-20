//
//  MenuSoldoutView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct MenuSoldoutView : View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.appAlert)
                .cornerRadius(15, corners: .topLeft)
                .cornerRadius(15, corners: .bottomLeft)
            Text("SOLD OUT")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .frame(height: 30)
                .background(Color.appAlert)
                
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.appAlert)
                .cornerRadius(15, corners: .topRight)
                .cornerRadius(15, corners: .bottomRight)
        }
    }
}

struct MenuSoldoutView_Previews : PreviewProvider {
    static var previews: some View {
        MenuSoldoutView()
    }
}
