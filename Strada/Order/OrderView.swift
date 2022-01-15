//
//  OrderView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

struct OrderView : View {
    var body: some View {
        NavigationView {
            ScrollView {
                FavoriteMenuView()
                Divider()
                MenuView()
            } // ScrollView
            .padding()
            .navigationBarTitle(Text(""), displayMode: .inline)
        } // NavigationView
    }
}

struct OrderView_Previews : PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
