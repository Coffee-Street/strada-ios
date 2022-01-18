//
//  SignView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct SignView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @State var phoneNumber: String = ""
    @State var isAutoLogin: Bool = false
    
    func isValidPhoneNumber() -> Bool {
        return phoneNumber.count > 0
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
                TextField("전화번호를 입력해주세요", text: $phoneNumber)
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
                    controller.goHome()
                }) {
                    Text("시작하기")
                        .font(.system(size: 15))
                }
                .foregroundColor(isValidPhoneNumber() ? Color.white : Color.black)
                .disabled(isValidPhoneNumber() == false)
                Spacer()
            }
            .frame(height: 40)
            .background(isValidPhoneNumber() ? Color.appBlue : Color.appBrownGray)
            
            HStack {
                Button(action: {
                    self.isAutoLogin.toggle()
                }) {
                    HStack {
                        Text("자동 로그인")
                            .font(.system(size: 10))
                            .foregroundColor(self.isAutoLogin ? .appBlue : .appBrownGray)
                        Image(systemName: self.isAutoLogin ? "checkmark" : "")
                            .font(.system(size: 10))
                            .padding(.leading, 5)
                            .padding(.bottom, 5)
                            .frame(width: 14, height: 14)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(self.isAutoLogin ? .appBlue : .appBrownGray))
                        Spacer()
                    }
                }
                //Toggle("자동 로그인", isOn: $isAutoLogin)
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SignView_Previews : PreviewProvider {
    static var previews: some View {
        SignView(controller: CurrentViewController("sign"))
    }
}
