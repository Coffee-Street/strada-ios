//
//  SplashView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct SplashView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image("logo")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            controller.viewName = "sign"
                        }
                    }
                Spacer()
            } //HStack
            Spacer()
        } //VStack
    }
}

struct SplashView_Previews : PreviewProvider {
    static var previews: some View {
        SplashView(controller: CurrentViewController("splash"))
    }
}
