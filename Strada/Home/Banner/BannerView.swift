//
//  BannerView.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

struct BannerView : View {
    
    @Binding var banners: [Banner]
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.appPrimary)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.appSemiHighlight)
    }
    
    var body: some View {
        TabView {
            ForEach($banners) { banner in
                BannerItemView(banner: banner)
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
    @State static var banners: [Banner] = [
        Banner(title: "달콤한 케이크\n추천해요!", image: "cup.and.saucer", name: "초콜릿 케이크", tags: ["1piece","4,000원"]),
        Banner(title: "달콤한 케이크\n추천해요!", image: "takeoutbag.and.cup.and.straw", name: "초콜릿 케이크", tags: ["1piece","4,000원"])
    ]
    static var previews: some View {
        BannerView(banners: $banners)
    }
}
