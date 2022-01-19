//
//  OneOnOneView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct OneOnOneView : View {
    
    @Binding var isOpened: Bool
    
    @State private var message: String = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("1:1 문의")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.leading)

                VStack(alignment: .trailing, spacing: 0) {
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("제가 아닌 다른 사람이 포인트를 사용한것 같아요. 어떻게 처리되는지 답변 부탁드립니다!")
                                .font(.system(size: 15))
                        }
                        .padding(15)
                    }
                    .foregroundColor(.white)
                    .frame(minWidth: 100, minHeight: 30)
                    .background(Color.appBlue)
                    .cornerRadius(15, corners: .bottomLeft)
                    .cornerRadius(15, corners: .topLeft)
                    .cornerRadius(15, corners: .topRight)
                    .padding(.bottom, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("다른 사람이 포인트를 도용해 사용한 경우에는 \n사실 확인 후 바로 포인트를 환불해드립니다. \n확인을 위해서 카드 내역과 이것저것 부탁드려요!")
                                .font(.system(size: 15))
                                
                            HStack {
                                Text("답변이 도움이 되셨나요?")
                                    .foregroundColor(.appBrownGray)
                                    .font(.system(size: 13))
                                Spacer()
                                Button(action: {}) {
                                    Image("thumbsup")
                                }
                            }
                        }
                        .padding(15)
                    }
                    .frame(minWidth: 100, minHeight: 30)
                    .border(Color.appBrownGray)
//                    .overlay(Rectangle().stroke(Color.appBrownGray, lineWidth: 3))
//                    .background(Color.appBrownGray)
                    .cornerRadius(15, corners: .topLeft)
                    .cornerRadius(15, corners: .topRight)
                    .cornerRadius(15, corners: .bottomRight)
                    .padding(.bottom, 8)
                }
                .padding()
                
                
                Spacer()
                
                HStack {
                    Image("plus.active")
                        .padding(.leading, 10)
                    TextField("", text: $message)
                        .frame(height: 48)
                    Button(action: {
                        
                    }) {
                        Text("전송")
                            .foregroundColor(message.trimmingCharacters(in: .whitespaces).count > 0 ? .appBlue : .appLightGray)
                            .font(.system(size: 17))
                    }
                    .padding(.trailing)
                }
                .background(Capsule().stroke(Color.appBrownGray, lineWidth: 2))
                .padding()
                
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isOpened = false
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 30))
                            .padding(.trailing)
                    }
                }
                Spacer()
            }
        }
        .background(.white)
    }
}

struct OneOnOneView_Previews : PreviewProvider {
    static var previews: some View {
        OneOnOneView(isOpened: .constant(false))
    }
}
