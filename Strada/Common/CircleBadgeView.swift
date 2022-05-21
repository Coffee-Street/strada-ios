//
//  CircleBadgeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import SwiftUI

struct CircleBadgeView : View {
    var body: some View {
        ZStack {
            Circle().fill(Color.appAlert)
                .frame(width: 7, height: 7)
        }
    }
}

struct CircleBadgeView_Previews : PreviewProvider {
    static var previews: some View {
        CircleBadgeView()
    }
}
