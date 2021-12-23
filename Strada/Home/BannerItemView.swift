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
    var symbolName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("달콤한 케이크\n추천해요!")
                .foregroundColor(Color.white).font(.subheadline)
                .padding(.leading, 20)
            
            HStack {
                Spacer()
                Image(systemName: self.symbolName)
                    .font(.system(size: 150))
                    .foregroundColor(Color.white)
                    .padding(.trailing, 20)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("초콜릿 케이크")
                    .foregroundColor(Color.white)
                    .font(.subheadline)
                HStack {
                    Text("#1piece")
                        .foregroundColor(Color.white)
                        .font(.caption)
                    Text("#4,000원")
                        .foregroundColor(Color.white)
                        .font(.caption)
                }
            }
            .padding(.leading, 20)
        }
        .frame(height: 300)
        .background(Color.blue)
        .cornerRadius(40, corners: .bottomLeft)
        .cornerRadius(40, corners: .topLeft)
        .padding(.leading, 30)
    }
}

struct BannerItemView_Previews : PreviewProvider
{
    static var previews: some View {
        BannerItemView(symbolName:  "cup.and.saucer")
    }
}
