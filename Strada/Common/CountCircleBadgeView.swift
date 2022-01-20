//
//  CountCircleBadgeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import SwiftUI

struct CountCircleBadgeView : View {
    
    @Binding var count: Int
    
    var body: some View {
        ZStack {
            Capsule().fill(Color.appOrange).frame(width: 26, height: 26)
            
            Text("\(count)")
                .foregroundColor(.white)
        }
    }
}

struct CountCircleBadgeView_Previews : PreviewProvider {
    static var previews: some View {
        CountCircleBadgeView(count: .constant(10))
    }
}
