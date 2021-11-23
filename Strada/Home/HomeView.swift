//
//  HomeView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("홈").foregroundColor(Color.blue)
                    Spacer()
                    Image(systemName: "questionmark").foregroundColor(Color.blue)
                        .padding(.trailing, 20)
                    Image(systemName: "bell")
                        .foregroundColor(Color.blue)
                }
                .padding(.horizontal, 20)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("어서오세요").foregroundColor(Color.gray).font(.subheadline)
                            Text("010-7702-3730").foregroundColor(Color.gray).font(.subheadline)
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            Text("3,950P").foregroundColor(Color.blue)
                                .font(.title)
                            Image(systemName:"greaterthan").foregroundColor(Color.blue)
                                .font(.title)
                        }
                    }
                    Spacer()
                } // HStack
                .padding()
            
                BannerView()
                
                Text("주문하기")
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 20)
                Image(systemName:"chevron.down")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bag")
                            .frame(width: 80, height: 73)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    }
                    .background(Color.blue)
                    .cornerRadius(40)
                    .padding()
                }
            } // VStack
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView()
    }
}
