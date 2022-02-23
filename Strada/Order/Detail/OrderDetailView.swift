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
    
    let menu_id: UUID
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .center, spacing: 0) {
                        Image("drinkHeader")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        HStack {
                            Text(viewModel.menu.name.kr)
                                .fontWeight(.medium)
                            Text(viewModel.menu.name.en)
                                .fontWeight(.thin)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.appBlue)
                        }
                    }
                    .padding(.horizontal)
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
                                    .foregroundColor(.appLightGray)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
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
                                            .foregroundColor(.appLightGray)
                                    }
                                }
                            } else {
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.options.indices, id: \.self) { index in
                            OrderDetailOptionView(option: $viewModel.options[index])
                        }
                    } // VStack
                    
                    Divider()
                        .padding()
                    
                    OrderDetailDrinkPersonalOptionView(personalOptions: $viewModel.personalOptions)
//                    OrderDetailBeanPersonalOptionView()
                        .padding(.horizontal)
                }
            }
            .padding(.bottom, 80)
            .edgesIgnoringSafeArea(.top)
            
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        
                    }){
                        Text("장바구니")
                            .foregroundColor(viewModel.isOrderable() ? .white : .appBrownGray)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                    .disabled(viewModel.isOrderable() == false)
                    .background(viewModel.isOrderable() ? Color.appBlue : Color.appVeryLightGray)
                    
                    NavigationLink(destination: PaymentView(controller: controller)) {
                        Text("바로주문")
                            .foregroundColor(viewModel.isOrderable() ? .white : .appBrownGray)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                    .disabled(viewModel.isOrderable() == false)
                    .background(viewModel.isOrderable() ? Color.appLightBlue : Color.appVeryLightGray)
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
            }
            .edgesIgnoringSafeArea(.bottom)
        } // ZStack
        .background(.white)
    }
}

struct OrderDetailView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailView(controller: CurrentViewController("orderDetail"), menu_id: UUID())
        
        OrderDetailView(controller: CurrentViewController("orderDetail"), menu_id: UUID())
            .previewDevice("iPhone 8")
    }
}
