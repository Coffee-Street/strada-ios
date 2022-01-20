//
//  CustomerView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct VoiceOfCustomerView : View {
    
    @Binding var isOpened: Bool
    
    @State private var isOpenedOneOnOne: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("고객의 소리")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom)
                
                Text("카페를 이용하면서 불편한 점이 있으셨나요?\n스트라다는 고객님들의 의견을 적극 수용합니다.")
                    .foregroundColor(.appBrownGray)
                    .font(.system(size: 13))
                    .padding(.bottom)
                             
                HStack {
                    Image("phone")
                        .padding(.trailing, 8)
                    Image("instagram")
                        .padding(.trailing, 8)
                    Image("facebook")
                }
                .padding(.bottom)
                
                Button(action: {
                    isOpenedOneOnOne.toggle()
                }) {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("1:1 문의하기")
                                .foregroundColor(Color.white)
                                .font(.system(size: 17, weight: .bold))
                                .padding(.leading, 20)
                        }
                        Spacer()
                    }
                    .frame(height: 88)
                    .background(Color.appBlue)
                    .cornerRadius(25, corners: .bottomLeft)
                    .cornerRadius(25, corners: .topLeft)
                    .padding(.leading, 5)
                }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("자주 묻는 질문")
                                .foregroundColor(.appBrownGray)
                                .font(.system(size: 13))
                                .padding(.bottom, 3)
                            Text("타인이 포인트를 사용한 경우")
                                .foregroundColor(.appBlack)
                                .font(.system(size: 17))
                        }
                        
                        Spacer()
                        Image("next.active")
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("자주 묻는 질문")
                                .foregroundColor(.appBrownGray)
                                .font(.system(size: 13))
                                .padding(.bottom, 3)
                            Text("타인이 포인트를 사용한 경우")
                                .foregroundColor(.appBlack)
                                .font(.system(size: 17))
                        }
                        
                        Spacer()
                        Image("next.active")
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("자주 묻는 질문")
                                .foregroundColor(.appBrownGray)
                                .font(.system(size: 13))
                                .padding(.bottom, 3)
                            Text("타인이 포인트를 사용한 경우")
                                .foregroundColor(.appBlack)
                                .font(.system(size: 17))
                        }
                        
                        Spacer()
                        Image("next.active")
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("자주 묻는 질문")
                                .foregroundColor(.appBrownGray)
                                .font(.system(size: 13))
                                .padding(.bottom, 3)
                            Text("타인이 포인트를 사용한 경우")
                                .foregroundColor(.appBlack)
                                .font(.system(size: 17))
                        }
                        
                        Spacer()
                        Image("next.active")
                    }
                    .padding(.vertical, 10)
                }
                .padding(.trailing)
                .padding(.vertical, 10)
                
                HStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Image("plus.active")
                        Text("더 보기")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 15))
                    }
                    
                    Spacer()
                }
                .padding(.trailing, 30)
                
                Spacer()
            } // VStack
            .padding(.leading)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isOpened = false
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 30))
                    }
                }
                Spacer()
            } // VStack
            .padding(.trailing)
            
            if isOpenedOneOnOne {
                OneOnOneView(isOpened: $isOpenedOneOnOne)
            }
            
        } // ZStack
        .background(.white)
    }
}

struct VoiceOfCustomerView_Previews : PreviewProvider {
    static var previews: some View {
        VoiceOfCustomerView(isOpened: .constant(false))
    }
}
