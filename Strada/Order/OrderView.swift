//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    @ObservedObject var controller: CurrentViewController
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        MenuView(controller: controller)
                    } // VStack
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: Alignment.topLeading)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Spacer()
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "multiply")
                                    .foregroundColor(.appPrimary)
                                    .font(.system(size: 30))
                            }
                        }
                        Spacer()
                    } // VStack
                    .padding(.trailing, 24)
                } // ZStack
            } // ScrollView
//            .background(.white)
            .edgesIgnoringSafeArea(.bottom)
        } //NavigationView
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            OrderView(controller: CurrentViewController("order"))
            
            OrderView(controller: CurrentViewController("order"))
                .preferredColorScheme(.dark)
//            OrderView(controller: CurrentViewController("order"))
//                .previewDevice("iPhone 8")
        }
        
    }
}
