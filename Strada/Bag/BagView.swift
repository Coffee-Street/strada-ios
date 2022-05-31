//
//  BagView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/21.
//

import SwiftUI

struct BagView : View {
    @ObservedObject var controller: CurrentViewController
    
    @StateObject private var viewModel = BagViewModel()
    
    @Environment(\.openURL) var openURL
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("주문 내역을\n확인해주세요")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 25)
                    
                    VStack {
                        ForEach(viewModel.bagItemViewModels.indices, id: \.self) { index in
                            PaymentItemView(viewModel: $viewModel.bagItemViewModels[index], onDelete: {
                                        viewModel.bagItemViewModels.remove(at: index)
                                }
                            )
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
                        } // HStack
                    } // VStack
                    .padding(.vertical)
                    
                    Divider()
                        .frame(height: 1)
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
                            } // HStack
                            .overlay(
                                Rectangle().fill(.white).frame(height: 1).offset(y: 14)
                            )
                        } // HStack
                    } // HStack
                    .padding(.vertical)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                    
                    HStack {
                        Text("결제할 금액")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        Spacer()
                        
                        Text("\(viewModel.getTotalPrice() - viewModel.usePoint)원")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                    } // HStack
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.kakaoPayReady() { kakaoPayReady in
                                print("tid: \(kakaoPayReady.tid)")
                                viewModel.tid = kakaoPayReady.tid
                                openURL(URL(string: kakaoPayReady.appUrl)!)
                            }
                        }) {
                            Text("카카오페이 결제")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                        // 모든 View라면 다 들고 있다는 onOpenURL인데.. 어떻게 쓰는건지 모르곘다
                        // 이거랑 딥링크 삽질했는데 딥링크는 전혀 다른거였다고 한다... URL Scheme도 생각한 것과 다른 것이었다
                        .onOpenURL { url in
                            print("PaymentView url scheme: \(String(describing: url.scheme)), url host: \(String(describing: url.host)), path: \(String(describing: url.path))")
                            
                            if url.host == "payment" {
                                if url.path == "/success" {
                                    if let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true) {
                                        
                                        var tid: String = viewModel.tid
                                        var pgToken: String = ""
                                        
                                        for query in components.queryItems! {
                                            print("\(query.name): \(query.value!)")
                                            
                                            if query.name == "pg_token" {
                                                pgToken = query.value!
                                            }
                                        }
                                        
                                        viewModel.kakaoPayApprove(tid: tid, pgToken: pgToken) { kakaoPayApprove in
                                            print(kakaoPayApprove)
                                            
                                            //TODO: Clear Basket
                                            viewModel.tid.removeAll()
                                            
                                            controller.goPaymentSuccess()
                                        }
                                    }
                                } else if url.path == "/fail" {
                                    controller.goPaymentFail()
                                } else if url.path == "/cancel" {
                                    //TODO: Alert Cancel
                                    viewModel.isCanceledPayment = true
                                } else {
                                    print("Invalid url path: \(url.path)")
                                }
                            }
                        }
                        .onChange(of: scenePhase) { newPhase in
                            if newPhase == .inactive {
                                print("Inactive")
                            } else if newPhase == .active {
                                //TODO: 여기서 pg_token을 받아오는 query를 BE에 요청하거나 Deeplink로 pg_token을 받아와야 함
                            } else if newPhase == .background {
                                print("Background")
                            }
                        }
                        .alert(isPresented: $viewModel.isCanceledPayment) {
                            Alert(title: Text("결제 취소"), message: Text("결제를 취소하셨습니다."), dismissButton: .default(Text("확인")))
                        }
                        Spacer()
                    }.padding()
                    
                } // VStack
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
                    .background(Color.appSecondary)
                }
            } // VStack
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color.appPrimary)
    }
}

struct PaymentView_Previews : PreviewProvider {
    static var previews: some View {
        BagView(controller: CurrentViewController("payment"))
    }
}
