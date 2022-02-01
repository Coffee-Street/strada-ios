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
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("영수증")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.bottom)
                        
                        Text("A-99")
                            .foregroundColor(.appBrownGray)
                            .font(.system(size: 17, weight: .medium))
                    }
                    
                    VStack {
                        HStack {
                            Text("접수")
                                .padding(.trailing, 20)
                            Text("완료")
                                .foregroundColor(.appBlue)
                                .fontWeight(.bold)
                            Spacer()
                            Text("2020.10.12 18:22")
                                .foregroundColor(.appBrownGray)
                        }
                        .padding(1)
                        
                        HStack {
                            Text("제조")
                                .padding(.trailing, 20)
                            Text("대기")
                            Spacer()
                            Text("2020.10.12 18:22")
                                .foregroundColor(.appBrownGray)
                        }
                        .padding(1)
                        
                        HStack {
                            Text("픽업")
                                .padding(.trailing, 20)
                            Text("")
                            Spacer()
                            Text("-")
                                .foregroundColor(.appBrownGray)
                        }
                    }
                    
                    Divider()
                        .background(Color.appBrownGray).padding(.vertical)
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("메뉴 이름")
                                Spacer()
                                Text("2개")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            HStack {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                        }
                        .padding(.bottom)
                        
                        VStack {
                            HStack {
                                Text("메뉴 이름")
                                Spacer()
                                Text("")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            HStack {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                        }
                        .padding(.bottom)
                        
                        VStack {
                            HStack {
                                Text("메뉴 이름")
                                Spacer()
                                Text("")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            HStack {
                                Text("옵션 / 사이즈")
                                Spacer()
                                Text("\(4000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                        }
                        .padding(.bottom)
                    }
                    
                    Divider()
                        .background(Color.appBrownGray)
                        .padding(.bottom)
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("총 금액")
                                Spacer()
                                Text("\(12000)원")
                                    .font(.system(size: 17, weight: .bold))
                            }
                            HStack {
                                Text("사용한 포인트")
                                Spacer()
                                Text("\(0)P")
                                    .font(.system(size: 17, weight: .bold))
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Divider()
                        .background(Color.appBrownGray)
                        .padding(.bottom)
                    
                    HStack {
                        Text("결제 금액")
                            .font(.system(size: 22))
                        Spacer()
                        Text("\(12000)원")
                            .font(.system(size: 22))
                    }
                    
                    Spacer()
                }
                .padding()
                
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Button(action: {}) {
                            Text("취소하기")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(self.isAvailableCancel ? Color.appOrange : Color.appBrownGray)

                        NavigationLink(destination: PaymentView(controller: controller)) {
                            Text("이대로 주문")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(Color.appBlue)
                    }
                    .navigationBarTitle(Text(""), displayMode: .inline)
                    .navigationBarHidden(true)
                }
                .edgesIgnoringSafeArea(.bottom)
                
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
            } // ZStack
            .background(.white)
        } // NavigationView
    }
}

struct ReceiptView_Previews : PreviewProvider {
    static var previews: some View {
        ReceiptView(controller: CurrentViewController("receipt"), isOpened: .constant(false))
    }
}
