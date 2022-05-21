//
//  CustomerView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct VoiceOfCustomerView : View {
    
    @State private var isOpenedOneOnOne: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("고객의 소리")
                        .foregroundColor(.appPrimary)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 28)
                    
                    Text("카페를 이용하면서 불편한 점이 있으셨나요?\n스트라다는 고객님들의 의견을 적극 수용합니다.")
                        .foregroundColor(.appSemiHighlight)
                        .font(.system(size: 13))
                        .padding(.bottom, 24)
                                 
                    HStack {
                        Button(action: {}) {
                            Image("phone")
                                .padding(.trailing, 8)
                        }
                        
                        Button(action: {}) {
                            Image("instagram")
                                .padding(.trailing, 8)
                        }
                        
                        Button(action: {}) {
                            Image("facebook")
                                .padding(.trailing, 8)
                        }
                    }
                    .padding(.bottom, 24)
                    
                    Button(action: {
                        isOpenedOneOnOne.toggle()
                    }) {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("1:1 문의하기")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 17, weight: .bold))
                                    .padding(.leading, 20)
                            }
                            Spacer()
                        }
                        .frame(height: 88)
                        .background(Color.appPrimary)
                        .cornerRadius(25, corners: .bottomLeft)
                        .cornerRadius(25, corners: .topLeft)
                    }
                    .padding(.bottom, 8)
                } // VStack
                .padding(.leading, 24)
                
                VStack(spacing: 0) {
                    ForEach(1..<7) { idx in
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("자주 묻는 질문")
                                    .foregroundColor(.appSemiHighlight)
                                    .font(.system(size: 13))
                                    .padding(.top, 11)
                                    .padding(.bottom, 4)
                                Text("타인이 포인트를 사용한 경우")
                                    .foregroundColor(.appTextPrimary)
                                    .font(.system(size: 17))
                                    .padding(.bottom, 11)
                            }
                            Spacer()
                            Image("next.active")
                        }
                        .padding(.bottom, 8)
                    }
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
                
                HStack(spacing: 0) {
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Image("plus.active")
                        Text("더 보기")
                            .foregroundColor(.appPrimary)
                            .font(.system(size: 15))
                    }
                    .padding(.vertical, 24)
                    Spacer()
                }
                
                Spacer()
            } // VStack
            
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
        } // ZStack
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $isOpenedOneOnOne) {
            OneOnOneView()
        }
    }
}

struct VoiceOfCustomerView_Previews : PreviewProvider {
    static var previews: some View {
        VoiceOfCustomerView()
    }
}
