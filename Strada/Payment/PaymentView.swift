//
//  PaymentView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/21.
//

import SwiftUI

struct PaymentView : View {
    @ObservedObject var controller: CurrentViewController
    
    @StateObject private var viewModel = PaymentViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("주문 내역을\n확인해주세요")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 25)
                    
                    VStack {
                        ForEach($viewModel.paymentItemViewModels.indices) { index in
                            PaymentItemView(paymentItemViewModel: $viewModel.paymentItemViewModels[index])
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("총 \(viewModel.getTotalCount())개")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                            
                            Spacer()
                            
                            Text("\(viewModel.getTotalPrice())원")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                    }
                    .padding(.vertical)
                    
                    Divider()
                        .background(.white)
                    
                    HStack {
                        Text("\(viewModel.availablePoint)P 보유")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(alignment: .lastTextBaseline) {
                            Button(action: {}) {
                                Text("전부 사용하기")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .overlay(Capsule().stroke(.white, lineWidth: 1.3))
                            
                            HStack(spacing: 0) {
                                TextField("", text: Binding(
                                    get: { "\(viewModel.usePoint)" },
                                    set: { viewModel.usePoint = Int($0) ?? 0 }
                                ))
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .medium))
                                    .fixedSize()
                                Text("P")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .medium))
                            }
                            .overlay(
                                Rectangle().fill(.white).frame(height: 1).offset(y: 14)
                            )
                            
                        }
                        
                        
                    }
                    .padding(.vertical)
                    
                    
                    Divider()
                        .background(.white)
                    
                    HStack {
                        Text("결제할 금액")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        Spacer()
                        
                        Text("\(viewModel.getTotalPrice() - viewModel.usePoint)원")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                    }
                }
                .padding()
            }
            
            VStack(spacing: 0) {
                Spacer()
                   
                Button(action: {
                    controller.goPaymentSuccess()
                }) {
                    HStack(spacing: 0) {
                        Spacer()
                        Text("결제하기")
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .frame(height: 96)
                    .background(Color.appLightBlue)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color.appBlue)
    }
}


struct PaymentView_Previews : PreviewProvider {
    static var previews: some View {
        PaymentView(controller: CurrentViewController("payment"))
    }
}
