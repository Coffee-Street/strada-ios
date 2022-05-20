//
//  ProfileView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/19.
//

import SwiftUI

struct ProfileView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @State private var isOpenedReceipt: Bool = false
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("내 정보")
                    .foregroundColor(.appPrimary)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom, 28)
                
                Text("\(self.viewModel.profile.point)P")
                    .font(.system(size: 35))
                    .padding(.bottom, 8)
                
                Text("포인트 관련 공지를 작성합니다.\n포인트는 어떠어떠할 때 사용하실 수 없습니다.")
                    .foregroundColor(.appSemiHighlight)
                    .font(.system(size: 13))
                
                Divider()
                    .frame(height: 1)
                    .background(Color.appHighlight)
                    .padding(.vertical, 24)
                
                HistoryView(isOpenedReceipt: $isOpenedReceipt)
                    .padding(.trailing, 24)
                
                Spacer()
            }
            .padding(.leading, 24)
//            .padding(.leading, 24)
            
            VStack {
                VStack(spacing: 0) {
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
                    .padding(.bottom, 24)
                    
                    HStack {
                        Spacer()
                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
                            controller.goSign()
                        }) {
                            Text("로그아웃")
                                .foregroundColor(.appAlert)
                                .font(.system(size: 15))
                        }
                    }
                } // VStack
                Spacer()
            } // VStack
            .padding(.trailing, 24)
            
            if isOpenedReceipt {
                ReceiptView(controller: controller, isOpened: $isOpenedReceipt)
            }
        } // ZStack
        .background(.white)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.getProfile()
        }
    }
}

struct ProfileView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView(controller: CurrentViewController("profile"))
    }
}
