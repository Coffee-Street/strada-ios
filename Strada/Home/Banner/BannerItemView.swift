//
//  BannerItem.swift
//  Strada
//
//  Created by 박종봉 on 2021/11/21.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct BannerItemView : View {
    
    @Binding var banner: Banner
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(banner.title)
                .foregroundColor(Color.appBackground).font(.subheadline)
                .padding(.leading, 20)
            
            HStack {
                Spacer()
                Image(systemName: banner.image)
                    .font(.system(size: 150))
                    .foregroundColor(Color.appBackground)
                    .padding(.trailing, 20)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(banner.name)
                    .foregroundColor(Color.appBackground)
                    .font(.subheadline)
                HStack {
                    ForEach(banner.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .foregroundColor(Color.appBackground)
                            .font(.caption)
                    }
                }
            }
            .padding(.leading, 20)
        }
        .frame(height: 300)
        .background(Color.appPrimary)
        .cornerRadius(40, corners: .bottomLeft)
        .cornerRadius(40, corners: .topLeft)
    }
}

struct BannerItemView_Previews : PreviewProvider
{
    @State static var banner: Banner = Banner(title: "달콤한 케이크\n추천해요!", image: "cup.and.saucer", name: "초콜릿 케이크", tags: ["1piece","4,000원"])
    static var previews: some View {
        BannerItemView(banner: $banner)
    }
}
