//
//  FavoriteMenuItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/28.
//

import SwiftUI

struct FavoriteMenuItemView : View {
    
    @Binding var menuName: String
    @Binding var menuPrice: Int
    @Binding var menuCount: Int
    @Binding var isMenuSoldout: Bool
    
    init(menuName: Binding<String>,
         menuPrice: Binding<Int>,
         menuCount: Binding<Int>,
         isMenuSoldout: Binding<Bool>) {
        _menuName = menuName
        _menuPrice = menuPrice
        _menuCount = menuCount
        _isMenuSoldout = isMenuSoldout
    }
    
    private let disableColor = Color(red: 207/255, green: 207/255, blue: 207/255)
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text(menuName)
                    .foregroundColor(self.isMenuSoldout ? disableColor : .black)
                    .padding(.bottom, 5)
                Text("옵션 / 사이즈")
                    .foregroundColor(self.isMenuSoldout ? disableColor : .black)
                    .padding(.bottom, 5)
                Text("\(menuPrice)원")
                    .foregroundColor(self.isMenuSoldout ? disableColor : .black)
                    .fontWeight(.semibold)
//                Text(menuPrice, format: .currency(code: "KRW"))
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    if self.isMenuSoldout {
                        MenuSoldoutView()
                    } else {
                        MenuCountView()
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .frame(maxHeight: 96)
    }
}

struct FavoriteMenuItemView_Previews : PreviewProvider {
    static var previews: some View {
        FavoriteMenuItemView(menuName: .constant("메뉴 이름"), menuPrice: .constant(4000),
            menuCount: .constant(0),
            isMenuSoldout: .constant(false))
    }
}
