//
//  ContentView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var controller = CurrentViewController("splash")
    
    var body: some View {
        if controller.viewName == "splash" {
            SplashView(controller: controller)
        } else if controller.viewName == "sign" {
            SignView(controller: controller)
        } else if controller.viewName == "home" {
            HomeView(controller: controller)
        } else if controller.viewName == "paymentSuccess" {
            PaymentSuccessView(controller: controller)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("iPhone 8")
    }
}
