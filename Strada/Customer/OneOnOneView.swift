//
//  OneOnOneView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct OneOnOneView : View {
    
    @State private var message: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("1:1 문의")
                    .foregroundColor(.appPrimary)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom, 44)

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 0) {
                                Text("제가 아닌 다른 사람이 포인트를 사용한것 같아요. 어떻게 처리되는지 답변 부탁드립니다!")
                                    .font(.system(size: 15))
                            }
                            .padding(15)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .background(Color.appPrimary)
                        .cornerRadius(15, corners: .bottomLeft)
                        .cornerRadius(15, corners: .topLeft)
                        .cornerRadius(15, corners: .topRight)
                        .padding(.bottom, 8)
                        
                        VStack {
                            HStack(spacing: 0) {
                                Spacer()
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("다른 사람이 포인트를 도용해 사용한 경우에는 \n사실 확인 후 바로 포인트를 환불해드립니다. \n확인을 위해서 카드 내역과 이것저것 부탁드려요!")
                                        .font(.system(size: 15))
                                        .padding(.bottom, 12)
                                        
                                    HStack(spacing: 0) {
                                        Text("답변이 도움이 되셨나요?")
                                            .foregroundColor(.appBrownGray)
                                            .font(.system(size: 13))
                                        Spacer()
                                        Button(action: {}) {
                                            Image("thumbsup")
                                        }
                                    }
                                }
                                .padding(16)
                                Spacer()
                            }
                            .background(.white)
                            .cornerRadius(14, corners: .topLeft)
                            .cornerRadius(14, corners: .topRight)
                            .cornerRadius(14, corners: .bottomRight)
                            .padding(0.8)
                        } // HStack
                        .background(Color.appBrownGray)
                        .cornerRadius(15, corners: .topLeft)
                        .cornerRadius(15, corners: .topRight)
                        .cornerRadius(15, corners: .bottomRight)
                        .padding(.bottom, 8)
                    } // VStack
                } // ScrollView
            } // VStack
            .padding(.horizontal, 24)
            
            VStack(spacing: 0) {
                Spacer()
                HStack(spacing: 0) {
                    Image("plus.active")
                        .padding(.leading, 10)
                    TextField("", text: $message)
                        .frame(height: 48)
                    Button(action: {}) {
                        Text("전송")
                            .foregroundColor(message.trimmingCharacters(in: .whitespaces).count > 0 ? .appPrimary : .appSemiHighlight)
                            .font(.system(size: 17))
                    }
                    .padding(.trailing)
                } // HStack
                .background(Capsule().stroke(Color.appSemiHighlight, lineWidth: 2))
            } // VStack
            .padding(.horizontal, 17)
            .padding(.bottom, 49)
            
            VStack {
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
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct OneOnOneView_Previews : PreviewProvider {
    static var previews: some View {
        OneOnOneView()
    }
}
