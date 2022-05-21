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
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Spacer()
                Image("logo")
                    .padding(.bottom, 50)
                Spacer()
            }
            .padding(.bottom, 24)
            
            VStack(spacing: 0) {
                TextField("전화번호를 입력해주세요", text: $viewModel.phoneNumber)
                    .foregroundColor(.appTextSecondary)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(.bottom, 20)
                    .overlay(VStack {
                        Divider()
                            .frame(height: /*isFocused ? 2 : */1)
                            .background(/*isFocused ? Color.appPrimary :*/ Color.appHighlight)
                            .offset(x: 0, y: 9)
                    })
            }
            .padding(.bottom, 25)
            
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
            .background(isValidPhoneNumber() ? Color.appPrimary : Color.appDisable)
            .padding(.bottom, 8)
            
            HStack {
                Button(action: {
                    viewModel.isAutoLogin.toggle()
                }) {
                    HStack(spacing: 0) {
                        Text("자동 로그인")
                            .font(.system(size: 10))
                            .foregroundColor(viewModel.isAutoLogin ? .appPrimary : .appSemiHighlight)
                            .padding(.trailing, 6)

                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(viewModel.isAutoLogin ? .appPrimary : .appSemiHighlight)
                            .frame(width: 17, height: 17)
                            .overlay(
                                Image(systemName: viewModel.isAutoLogin ? "checkmark" : "")
                                    .foregroundColor(.appPrimary)
                                    .font(.system(size: 15, weight: .semibold))
                                    .padding(.leading, 3)
                                    .padding(.bottom, 3)
//                                    .clipShape(Circle())
                                )
                        Spacer()
                    }
                }
                //Toggle("자동 로그인", isOn: $isAutoLogin)
                Spacer()
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .onOpenURL { url in
            print("SignView url scheme: \(String(describing: url.scheme)), url host: \(String(describing: url.host))")
        }
    }
}

struct SignView_Previews : PreviewProvider {
    static var previews: some View {
        SignView(controller: CurrentViewController("sign"))
            .preferredColorScheme(.light)
        
        SignView(controller: CurrentViewController("sign"))
            .preferredColorScheme(.dark)
    }
}
