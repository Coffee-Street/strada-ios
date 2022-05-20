//
//  ReceiptView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import SwiftUI

struct ReceiptView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @Binding var isOpened: Bool
    
    @State private var isAvailableCancel: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("영수증")
                            .foregroundColor(.appPrimary)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.trailing, 10)
                        
                        Text("A-99")
                            .foregroundColor(.appSemiHighlight)
                            .font(.system(size: 17, weight: .medium))
                    }
                    .frame(height: 34)
                    .padding(.bottom, 36)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("접수")
                                .padding(.trailing, 31)
                            Text("완료")
                                .foregroundColor(.appPrimary)
                                .fontWeight(.bold)
                            Spacer()
                            Text("2020.10.12 18:22")
                                .foregroundColor(.appSemiHighlight)
                        }
                        .frame(height: 26)
                        .padding(.bottom, 4)
                        
                        HStack(spacing: 0) {
                            Text("제조")
                                .padding(.trailing, 31)
                            Text("대기")
                            Spacer()
                            Text("2020.10.12 18:22")
                                .foregroundColor(.appSemiHighlight)
                        }
                        .frame(height: 26)
                        .padding(.bottom, 4)
                        
                        HStack(spacing: 0) {
                            Text("픽업")
                                .padding(.trailing, 31)
                            Text("")
                            Spacer()
                            Text("-")
                                .foregroundColor(.appSemiHighlight)
                        }
                        .frame(height: 26)
                    }
                    .padding(.trailing, 24)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.appHighlight)
                        .padding(.top, 16)
                        .padding(.bottom, 24)
                    
                    VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("메뉴 이름")
                                Spacer()
                                Text("2개")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                            .padding(.bottom, 2)
                            HStack(spacing: 0) {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                        }
                        .padding(.bottom, 16)
                        
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("메뉴 이름")
                                Spacer()
                                Text("")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                            .padding(.bottom, 2)
                            HStack(spacing: 0) {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                        }
                        .padding(.bottom, 16)
                        
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Text("메뉴 이름")
                                Spacer()
                                Text("")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                            .padding(.bottom, 2)
                            HStack(spacing: 0) {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            .frame(height: 26)
                        }
                    }
                    .padding(.trailing, 24)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.appHighlight)
                        .padding(.top, 26)
                        .padding(.bottom, 16)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("총 금액")
                            Spacer()
                            Text("\(12000)원")
                                .font(.system(size: 17, weight: .bold))
                        }
                        .frame(height: 26)
                        .padding(.bottom, 8)
                        HStack(spacing: 0) {
                            Text("사용한 포인트")
                            Spacer()
                            Text("\(0)P")
                                .font(.system(size: 17, weight: .bold))
                        }
                        .frame(height: 26)
                    }
                    .padding(.trailing, 24)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.appHighlight)
                        .padding(.vertical, 16)
                    
                    HStack(spacing: 0) {
                        Text("결제 금액")
                            .font(.system(size: 22))
                        Spacer()
                        Text("\(12000)원")
                            .font(.system(size: 22))
                    }
                    .frame(height: 34)
                    .padding(.trailing, 24)
                    
                    Spacer()
                } // VStack
                .padding(.leading, 24)
                
                VStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        Button(action: {}) {
                            Text("취소하기")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(self.isAvailableCancel ? Color.appAlert : Color.appSemiHighlight)

                        NavigationLink(destination: PaymentView(controller: controller)) {
                            Text("이대로 주문")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(Color.appPrimary)
                    }
                } // VStack
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isOpened = false
                        }) {
//                            Image("close.large.active")
                            Image(systemName: "multiply")
                                .foregroundColor(.appPrimary)
                                .font(.system(size: 30))
                                .frame(width: 36, height: 36)
                        }
                    } // HStack
                    Spacer()
                } // VStack
                .padding(.trailing, 24)
            } // ZStack
            .navigationBarHidden(true)
            .background(.white)
            .edgesIgnoringSafeArea(.bottom)
        } // NavigationView
    }
}

struct ReceiptView_Previews : PreviewProvider {
    static var previews: some View {
        ReceiptView(controller: CurrentViewController("receipt"), isOpened: .constant(false))
    }
}
