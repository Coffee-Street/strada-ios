//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct OrderView : View {
    let myColor = Color(red: 207/255, green: 207/255, blue: 207/255)
    let myBackgroundColor = Color(red: 238/255, green: 238/255, blue: 238/255)
    
    let detailContent = "합리적 가격에 단맛과 산미가 조화롭습니다.\n생산지 : 브라질 세하도 모지아나\n등급 : 없음 | 품종 : 옐로우카투아이\n가공 : Natural | 로스팅 : 시티"
    
    @State private var isFavorite = false
    
    @State private var isDetail = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .center, spacing: 0) {
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.system(size: 250))
    //                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(myBackgroundColor)
                    
                    HStack {
                        HStack {
                            Text("아메리카노")
                                .fontWeight(.medium)
                            Text("Americano")
                                .fontWeight(.thin)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.system(size: 20, weight: .medium))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                    HStack {
                        ForEach(["산미", "브라질", "단맛"], id: \.self) { hashtag in
                            Text("#\(hashtag)")
                        }
                        
                        Button(action: {
                                self.isDetail = true
                        }) {
                            if self.isDetail == false {
                                Text("자세히")
                                    .foregroundColor(.secondary)
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
                                            .foregroundColor(.secondary)
                                    }
                                }
                            } else {
                                
                            }
                            
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    OrderDrinkOptionView()
                }
            }
            .padding(.bottom, 80)
            
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        
                    }){
                        Text("장바구니")
                            .foregroundColor(.secondary)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                
                    Button(action: {
                        
                    }){
                        Text("바로주문")
                            .foregroundColor(.secondary)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 96)
                }
    //            .padding(.bottom, 14)
                .background(myBackgroundColor)
            }
            .edgesIgnoringSafeArea(.bottom)
            
        } // ZStack
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView()
        
        OrderView()
            .previewDevice("iPod touch (7th generation)")
    }
}
