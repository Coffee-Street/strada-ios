//
//  HomeView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct HomeView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("홈")
                        .font(.system(size: 20))
                        .foregroundColor(.appBlue)
                        .padding(.leading, 10)

                    Spacer()
                    Image(systemName: "questionmark")
                        .font(.system(size: 20))
                        .foregroundColor(.appBlue)
                        .padding(.trailing, 20)
                    Image(systemName: "bell")
                        .font(.system(size: 20))
                        .foregroundColor(.appBlue)
                        .padding(.trailing, 10)
                }
                .padding(.horizontal, 20)
                
                ProfileView()
                .padding()
            
                BannerView()
                    .frame(height: 380)
                
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
        } // ZStack
//        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView(controller: CurrentViewController("home"))
    }
}
