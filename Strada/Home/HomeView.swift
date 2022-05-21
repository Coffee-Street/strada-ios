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

    @State private var isNewNotice: Bool = false
    @State private var bagCount: Int = 0
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("홈")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.appBlue)

                            Spacer()
                            
                            Button(action: {
                                isOpenedVoc.toggle()
                            }) {
                                Image("voc")
                            }
                            
                            Button(action: {
                                isOpenedNotice.toggle()
                            }) {
                                Image("bell.active")
                                    .overlay(
                                        CircleBadgeView()
                                            .position(x: 34, y: 13)
                                            .opacity(self.isNewNotice ? 1 : 0)
                                    )
                            }
                        } // HStack
                        .padding(.trailing, 16)

                        HStack(spacing: 0) {
                            Button(action: {
                                isOpenedProfile.toggle()
                            }) {
                                ProfileSummaryView(profileSummary: $viewModel.profileSummary)
                            }
                            Spacer()
                        }
                        .onAppear {
                            viewModel.getProfile()
                        } // HStack
                    
                        BannerView(banners: $viewModel.banners)
                            .frame(height: 380)
                            .onAppear {
                                //viewModel.getBanners()
                            }
                    } // VStack
                    .padding(.leading, 24)

                    Button(action: {
                        isOpenedOrder.toggle()
                    }) {
                        VStack(spacing: 0) {
                            Text("주문하기")
                                .font(.title)
                                .foregroundColor(.appBlue)
                                
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .foregroundColor(.appBlue)
                                .frame(width: 48, height: 48)
                        }
                        .padding(.top, 106)
                    }
                } // VStack
                
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: BagView(controller: controller)) {
                            Image("bag")
                                .frame(width: 70, height: 63)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        }
                        .background(Color.appBlue)
                        .cornerRadius(35)
                        .overlay(
                            CountCircleBadgeView(count: $bagCount)
                                .position(x: 62, y: 10)
                                .opacity(bagCount > 0 ? 1 : 0))
                        .padding(.trailing, 16)
                        .padding(.bottom, 45)
                    }
                    .navigationBarTitle(Text(""), displayMode: .inline)
                } // VStack
            } // ZStack
            .navigationBarHidden(true)
            .background(.white)
        } // NavigationView
        .fullScreenCover(isPresented: $isOpenedNotice) {
            NoticeView(controller: controller)
        }
        .fullScreenCover(isPresented: $isOpenedProfile) {
            ProfileView(controller: controller)
        }
        .fullScreenCover(isPresented: $isOpenedVoc) {
            VoiceOfCustomerView()
        }
        .fullScreenCover(isPresented: $isOpenedOrder) {
            OrderView(controller: controller)
        }
        .onOpenURL { url in
            print("HomView url scheme: \(String(describing: url.scheme)), url host: \(String(describing: url.host))")
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView(controller: CurrentViewController("home"))
    }
}
