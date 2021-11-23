//
//  BannerView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct BannerView : View {
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray
        
        
    }
    
    var body: some View {
        TabView {
            ForEach(["cup.and.saucer", "takeoutbag.and.cup.and.straw"], id: \.self) { symbolName in
                BannerItemView(symbolName: symbolName)
            }
        }
        .onAppear {
            setupAppearance()
        }
        .tabViewStyle(.page)
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct BannerView_Previews : PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
