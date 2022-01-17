//
//  MenuItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

struct MenuItemView : View {
    
    @Binding var menuName: String
    @Binding var menuPrice: Int
    @Binding var menuState: MenuState
    
    init(menuName: Binding<String>,
         menuPrice: Binding<Int>,
         menuState: Binding<MenuState> = .constant(.AVAILABLE)
    ) {
        _menuName = menuName
        _menuPrice = menuPrice
        _menuState = menuState
    }
    
    private func menuTextColor() -> Color {
        switch self.menuState {
        case .AVAILABLE:
            return .black
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color.appLightGray
        }
    }
    
    private func menuImageColor() -> Color {
        switch self.menuState {
        case .AVAILABLE:
            return Color.appVeryLightGray
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color.appVeryLightGray
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(menuName)
                        .foregroundColor(menuTextColor())
                        .padding(.bottom, 5)
                    Text("\(menuPrice)원")
                        .foregroundColor(menuTextColor())
                        .fontWeight(.semibold)
    //                Text(menuPrice, format: .currency(code: "KRW"))
                }
                
//                Circle().fill(Color(red: 237/255, green: 237/255, blue: 237/255))
//                    .overlay(Circle().stroke())
                Spacer()
                
                Image("") // systemName: "cup.and.saucer"
                    .foregroundColor(menuTextColor())
                    .font(.system(size: 30))
                    .frame(width: 50, height: 50)
                    .background(menuImageColor())
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.appLightGray, lineWidth: 2))
                    .padding(.trailing, 1)
                    
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if self.menuState == .SOLD_OUT {
                        MenuSoldoutView()
                    } else if self.menuState == .COMING_SOON {
                        MenuComingSoonView()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxHeight: 72)
    }
}

struct MenuItemView_Previews : PreviewProvider {
    static var previews: some View {
        MenuItemView(
            menuName: .constant("메뉴 이름"),
            menuPrice: .constant(4000),
            menuState: .constant(.AVAILABLE)
        )
    }
}
