//
//  HomeView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct HomeView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @State private var isOpenedVoc: Bool = false
    @State private var isOpenedNotice: Bool = false
    @State private var isOpenedProfile: Bool = false
    @State private var isOpenedOrder: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Text("홈")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.appBlue)
                        .padding(.leading, 10)

                    Spacer()
                    Button(action: {
                        isOpenedVoc.toggle()
                    }) {
                        Image("voc")
                            .font(.system(size: 20))
                            .foregroundColor(.appBlue)
                    }
                    
                    Button(action: {
                        isOpenedProfile.toggle()
                    }) {
                        Image("bell.active")
                            .font(.system(size: 20))
                            .foregroundColor(.appBlue)
                    }
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Button(action: {
                        isOpenedProfile.toggle()
                    }) {
                        UserView()
                    }
                    Spacer()
                }
                .padding(.horizontal)
            
                BannerView()
                    .frame(height: 380)
                
                Button(action: {
                    withAnimation {
                        isOpenedOrder.toggle()
                    }
                }) {
                    VStack {
                    Text("주문하기")
                        .font(.title)
                        .foregroundColor(.appBlue)
                        .padding(.bottom, 20)
                    Image(systemName:"chevron.down")
                        .font(.title)
                        .foregroundColor(.appBlue)
                    }
                    .padding(.bottom, 30)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bag")
                            .frame(width: 70, height: 63)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    }
                    .background(Color.appBlue)
                    .cornerRadius(35)
                    .padding()
                }
            } // VStack
            
            if self.isOpenedVoc {
                VoiceOfCustomerView(isOpened: $isOpenedVoc)
            }
            
            if self.isOpenedProfile {
                ProfileView(isOpened: $isOpenedProfile)
            }
            
            if self.isOpenedOrder {
                OrderView(isOpened: $isOpenedOrder)
                    .transition(.move(edge: .bottom))
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
        } // ZStack
//        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView(controller: CurrentViewController("home"))
    }
}
