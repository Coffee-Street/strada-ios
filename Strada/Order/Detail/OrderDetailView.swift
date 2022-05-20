//
//  OrderDetailView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct OrderDetailView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @StateObject private var viewModel = OrderDetailViewModel()
    
    @State private var isFavorite = false
    
    @State private var isDetail = false
    
    @State private var askMoveBag = false
    
    @State private var isActive = false
    
    @Environment(\.presentationMode) var presentationMode
    
    let menu_id: UUID
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Image("drinkHeader")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            HStack {
                                Text(viewModel.menu.name.kr)
                                    .fontWeight(.medium)
                                Text(viewModel.menu.name.en)
                                    .fontWeight(.thin)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                isFavorite.toggle()
                            }) {
                                Image(isFavorite ? "heart.active" : "heart")
                                    
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            ForEach(viewModel.hashTags, id: \.self) { hashtag in
                                Text("#\(hashtag)")
                            }
                            
                            Button(action: {
                                    self.isDetail = true
                            }) {
                                if self.isDetail == false {
                                    Text("자세히")
                                        .foregroundColor(.appSemiHighlight)
                                }
                            }
                        } // HStack
                        
                        VStack(alignment: .leading, spacing: 0) {
                            if self.isDetail {
                                if let lastIdx = viewModel.detailContent.lastIndex(of: "\n")  {
                                    Text(viewModel.detailContent[..<lastIdx])
                                    
                                    let lastRange = viewModel.detailContent.index(after: lastIdx)..<viewModel.detailContent.endIndex
                                    
                                    HStack {
                                        Text(viewModel.detailContent[lastRange])
                                        Button(action: {
                                            self.isDetail = false
                                        }) {
                                            Text("접기")
                                                .foregroundColor(.appSemiHighlight)
                                        }
                                    }
                                } else {
                                    
                                }
                            }
                        } // VStack
                    } // VStack
                    .padding(.leading, 24)
                    .padding(.trailing, 16)
                    .padding(.bottom, 24)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.options.indices, id: \.self) { index in
                            OrderDetailOptionView(option: $viewModel.options[index])
                        }
                    } // VStack
                    .padding(.leading, 24)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.appHighlight)
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                        .padding(.leading, 24)
                        
                    
                    OrderDetailDrinkPersonalOptionView(personalOptions: $viewModel.personalOptions)
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                } // VStack
                .padding(.bottom, 80)
            } // ScrollView
            .padding(.bottom, 80)
            
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    NavigationLink(destination: PaymentView(controller: controller), isActive: $isActive) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        askMoveBag.toggle()
                    }){
                        Text("장바구니")
                            .foregroundColor(viewModel.isOrderable() ? .white : .appSemiHighlight)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                    .disabled(viewModel.isOrderable() == false)
                    .background(viewModel.isOrderable() ? Color.appPrimary : Color.appHighlight)
                    .alert(isPresented: $askMoveBag) {
                        Alert(title: Text("장바구니에 담겼습니다"), message: Text("장바구니로 이동하시겠습니까?"), primaryButton: .default(Text("이동")) {
                                isActive.toggle()
                            },
                            secondaryButton: .default(Text("돌아가기")) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        )
                    }
                    
                    NavigationLink(destination: PaymentView(controller: controller)) {
                        Text("바로주문")
                            .foregroundColor(viewModel.isOrderable() ? .white : .appSemiHighlight)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                    .disabled(viewModel.isOrderable() == false)
                    .background(viewModel.isOrderable() ? Color.appSecondary : Color.appHighlight)
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
            }
        } // ZStack
        .background(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct OrderDetailView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailView(controller: CurrentViewController("orderDetail"), menu_id: UUID())
        
        OrderDetailView(controller: CurrentViewController("orderDetail"), menu_id: UUID())
            .previewDevice("iPhone 8")
    }
}
