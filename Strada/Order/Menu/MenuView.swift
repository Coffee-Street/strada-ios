//
//  MenuView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/15.
//

import SwiftUI

struct MenuView : View {
    
    @Binding var categories: [String]
    
    @Binding var menus: [String:[Menu]]
    
    @State private var selectedCategory: String
    
    init(categories: Binding<[String]>, menus: Binding<[String:[Menu]]>) {
        _categories = categories
        _menus = menus
        _selectedCategory = State(initialValue: _categories.first?.wrappedValue ?? "")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MenuCategoryView(categories: $categories, selected: $selectedCategory)
            .padding(.bottom, 35)
            
            VStack {
                if (menus[selectedCategory] != nil) {
                    ForEach(menus[selectedCategory]!) { menu in
                        NavigationLink(destination: OrderDetailView()) {
                            MenuItemView(menu: menu)
                        }
                    }
                }
            }
        }
    }
}

struct MenuView_Previews : PreviewProvider {
    @State static var categories = [
        "커피",
        "차",
        "에이드",
        "디저트",
        "브런치"
    ]
    
    @State static var menus: [String:[Menu]] = [
        "커피": [
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .SOLD_OUT, name: "메뉴 이름", price: 1500),
            Menu(state: .COMING_SOON, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
            Menu(state: .AVAILABLE, name: "메뉴 이름", price: 1500),
        ],
        "차": [
            
        ],
        "에이드": [
        ],
        "디저트": [
        ],
        "브런치": [
        ]
    ]
    
    static var previews: some View {
        MenuView(categories: $categories, menus: $menus)
    }
}
