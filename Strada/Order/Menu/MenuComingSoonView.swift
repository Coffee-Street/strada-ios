//
//  MenuComingSoon.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

struct MenuComingSoonView : View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.blue)
                .cornerRadius(15, corners: .topLeft)
                .cornerRadius(15, corners: .bottomLeft)
            Text("COMING SOON")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .frame(height: 30)
                .background(Color.blue)
                
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.blue)
                .cornerRadius(15, corners: .topRight)
                .cornerRadius(15, corners: .bottomRight)
        }
    }
}

struct MenuComingSoonView_Previews : PreviewProvider {
    static var previews: some View {
        MenuComingSoonView()
    }
}
