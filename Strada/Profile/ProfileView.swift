//
//  ProfileView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/19.
//

import SwiftUI

struct ProfileView : View {
    
    @Binding var isOpened: Bool
    
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("내 정보")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom)
                
                Text("\(3950)P")
                    .font(.system(size: 35))
                    .padding(.bottom, 5)
                
                Text("포인트 관련 공지를 작성합니다.\n포인트는 어떠어떠할 때 사용하실 수 없습니다.")
                    .foregroundColor(.appBrownGray)
                    .font(.system(size: 13))
                
                Divider()
                    .background(Color.appBrownGray)
                    .padding(.vertical)
                
                HistoryView(categories: $viewModel.categories, histories: $viewModel.histories)
                
                Spacer()
            }
            .padding()
            
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
        
    }
}

struct ProfileView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView(isOpened: .constant(false))
    }
}
