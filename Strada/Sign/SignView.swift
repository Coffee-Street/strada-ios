//
//  SignView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct SignView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @StateObject private var viewModel = SignViewModel()
    
    @State var showAlert: Bool = false
    
    func isValidPhoneNumber() -> Bool {
        return viewModel.phoneNumber.count > 0
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image("logo")
                    .padding(.bottom, 50)
                Spacer()
            }
            
            VStack {
                TextField("전화번호를 입력해주세요", text: $viewModel.phoneNumber)
                    .foregroundColor(.appBlack)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(.bottom, 20)
                    .overlay(VStack {
                        Divider()
                            .offset(x: 0, y: 15)
                    })
            }
            
            HStack {
                Spacer()
                Button(action: {
                    // TODO: network access & validation check
                    
                    self.viewModel.login() {
                        if self.viewModel.isLoginSucceed {
                            controller.goHome()
                        }
                        else {
                            showAlert.toggle()
                        }
                    }
                }) {
                    Text("시작하기")
                        .font(.system(size: 15))
                }
                .foregroundColor(isValidPhoneNumber() ? Color.white : Color.black)
                .disabled(isValidPhoneNumber() == false)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("로그인 실패"), message: Text(viewModel.getErrorMessage()), dismissButton: .default(Text("확인")))
                }
                Spacer()
            }
            .frame(height: 40)
            .background(isValidPhoneNumber() ? Color.appBlue : Color.appBrownGray)
            
            HStack {
                Button(action: {
                    viewModel.isAutoLogin.toggle()
                }) {
                    HStack {
                        Text("자동 로그인")
                            .font(.system(size: 10))
                            .foregroundColor(viewModel.isAutoLogin ? .appBlue : .appBrownGray)
                        Image(systemName: viewModel.isAutoLogin ? "checkmark" : "")
                            .font(.system(size: 10))
                            .padding(.leading, 5)
                            .padding(.bottom, 5)
                            .frame(width: 14, height: 14)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(viewModel.isAutoLogin ? .appBlue : .appBrownGray))
                        Spacer()
                    }
                }
                //Toggle("자동 로그인", isOn: $isAutoLogin)
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .background(.white)
    }
}

struct SignView_Previews : PreviewProvider {
    static var previews: some View {
        SignView(controller: CurrentViewController("sign"))
    }
}
