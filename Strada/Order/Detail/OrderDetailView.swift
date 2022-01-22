//
//  OrderDetailView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct OrderDetailView : View {
    let menuNameKr = "아메리카노"
    let menuNameEn = "Americano"
    
    let hashTags = ["산미", "브라질", "단맛"]
    
    let detailContent = "합리적 가격에 단맛과 산미가 조화롭습니다.\n생산지 : 브라질 세하도 모지아나\n등급 : 없음 | 품종 : 옐로우카투아이\n가공 : Natural | 로스팅 : 시티"
    
    @ObservedObject var controller: CurrentViewController
    
    @State private var isFavorite = false
    
    @State private var isDetail = false
    
    @State private var isComplete = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .center, spacing: 0) {
                            Image("drinkHeader")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                        HStack {
                            HStack {
                                Text(menuNameKr)
                                    .fontWeight(.medium)
                                Text(menuNameEn)
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
                            ForEach(hashTags, id: \.self) { hashtag in
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
                                if let lastIdx = detailContent.lastIndex(of:  "\n")  {
                                    Text(detailContent[..<lastIdx])
                                    
                                    let lastRange = detailContent.index(after: lastIdx)..<detailContent.endIndex
                                    
                                    HStack {
                                        Text(detailContent[lastRange])
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
                        
                        OrderDrinkOptionView(isComplete: $isComplete)
                    }
                }
                .padding(.bottom, 80)
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                
                VStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            
                        }){
                            Text("장바구니")
                                .foregroundColor(self.isComplete ? .white : .appBrownGray)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(self.isComplete ? Color.appBlue : Color.appVeryLightGray)
                    
                        NavigationLink(destination: PaymentView(controller: controller)) {
                            Text("바로주문")
                                .foregroundColor(self.isComplete ? .white : .appBrownGray)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 96)
                        .background(self.isComplete ? Color.appLightBlue : Color.appVeryLightGray)
                    }
                    //.padding(.bottom, 14)
                    //.background(Color.appVeryLightGray)
                }
                .edgesIgnoringSafeArea(.bottom)
            } // ZStack
        }
    }
}

struct OrderDetailView_Previews : PreviewProvider {
    static var previews: some View {
        OrderDetailView(controller: CurrentViewController("orderDetail"))
        
        OrderDetailView(controller: CurrentViewController("orderDetail"))
            .previewDevice("iPhone 8")
    }
}
