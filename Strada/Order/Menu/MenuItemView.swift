//
//  MenuItemView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

struct MenuItemView : View {
    
    let menu: Menu
    
    private func menuTextColor() -> Color {
        switch self.menu.state {
        case .AVAILABLE:
            return .appTextPrimary
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color.appSemiHighlight
        }
    }
    
    private func menuImageBackgroundColor() -> Color {
        switch self.menu.state {
        case .AVAILABLE:
            return Color.appHighlight
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color.appHighlight.opacity(0.2)
        }
    }
    
    private func menuImageOverlayColor() -> Color {
        switch self.menu.state {
        case .AVAILABLE:
            return Color.appSemiHighlight
        case .SOLD_OUT:
            fallthrough
        case .COMING_SOON:
            return Color.appSemiHighlight.opacity(0.2)
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(menu.name.kr)
                        .foregroundColor(menuTextColor())
                        .padding(.bottom, 5)
                    Text("\(menu.price)원")
                        .foregroundColor(menuTextColor())
                        .fontWeight(.semibold)
    //                Text(menuPrice, format: .currency(code: "KRW"))
                }
                
                Spacer()
                
                Image("") // systemName: "cup.and.saucer"
                    .foregroundColor(menuTextColor())
                    .font(.system(size: 30))
                    .frame(width: 50, height: 50)
                    .background(menuImageBackgroundColor())
                    .clipShape(Circle())
                    .overlay(Circle().stroke(menuImageOverlayColor(), lineWidth: 2))
                    .padding(.trailing, 1)
                    
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if self.menu.state == .SOLD_OUT {
                        MenuSoldoutView()
                    } else if self.menu.state == .COMING_SOON {
                        MenuComingSoonView()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(height: 72)
    }
}

struct MenuItemView_Previews : PreviewProvider {
    static var previews: some View {
        MenuItemView(menu: Menu(type: .COFFEE, state: .AVAILABLE, name: MenuName(kr: "메뉴 이름", en: "Menu Name"), price: 4000))
    }
}
