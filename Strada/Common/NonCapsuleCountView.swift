//
//  NonCapsuleCountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/02.
//

import SwiftUI

struct NonCapsuleCountView : View {
    @State var count: Int = 0
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                if self.count > 0 {
                    self.count -= 1
                }
            }) {
                Text("-")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
            }
            .frame(width: 30, height: 30)
            .background(Color.blue)
            .cornerRadius(15, corners: .topLeft)
            .cornerRadius(15, corners: .bottomLeft)
            .disabled(self.count < 1)
            
            Text("\(self.count)")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .frame(width: 30, height: 30)
                .background(Color.blue)
            
            Button(action: {
                self.count += 1
            }) {
                Text("+")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
            }
            .frame(width: 30, height: 30)
            .background(Color.blue)
            .cornerRadius(15, corners: .topRight)
            .cornerRadius(15, corners: .bottomRight)
        }
    }
}

struct NonCapsuleCountView_Previews : PreviewProvider {
    static var previews: some View {
        NonCapsuleCountView()
    }
}
