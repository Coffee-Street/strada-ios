//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    @ObservedObject var controller: CurrentViewController
    
    @Binding var isOpened: Bool
    
    @State private var viewModel = OrderViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        MenuView(controller: controller)
                    } // VStack
                    .padding(.horizontal)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:0, alignment: Alignment.topLeading)
                    
                    VStack(alignment: .leading, spacing: 0) {
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
                        .padding(.trailing)
                        Spacer()
                    } // VStack
                } // ZStack
                .background(.white)
            } // ScrollView
        } // ZStack    
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView(controller: CurrentViewController("order"), isOpened: .constant(false))
    }
}
