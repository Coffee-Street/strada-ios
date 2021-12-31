//
//  MenuItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

enum MenuState : Int {
    case AVAILABLE = 1
    case SOLD_OUT
    case COMING_SOON
}

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
    
    private let disableColor = Color(red: 207/255, green: 207/255, blue: 207/255)
    
    private func menuTextColor() -> Color {
        switch self.menuState {
        case .AVAILABLE:
            return .black
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return disableColor
        }
    }
    
    private func menuImageColor() -> Color {
        switch self.menuState {
        case .AVAILABLE:
            return disableColor
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color(red: 237/255, green: 237/255, blue: 237/255)
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
                
                Image(systemName: "cup.and.saucer")
                    .foregroundColor(menuTextColor())
                    .font(.system(size: 30))
                    .frame(width: 50, height: 50)
                    .background(menuImageColor())
                    .clipShape(Circle())
                    .overlay(Circle().stroke(menuImageColor(), lineWidth: 2))
                    
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
            menuState: .constant(MenuState.COMING_SOON)
        )
    }
}
