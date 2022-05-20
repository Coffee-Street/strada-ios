//
//  NoticeItemView.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/07.
//

import SwiftUI

struct NoticeItemView : View {
    
    let notice: Notice
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(notice.title)
                        .foregroundColor(getTitleFontColor())
                        .fontWeight(.medium)
                        .overlay {
                            ZStack {
                                CircleBadgeView()
                                    .opacity(notice.detect ? 0.0 : 1.0)
                            }
                            .alignmentGuide(.top) { $0.height / 2 - 3 }
                            .alignmentGuide(.trailing) { $0.width / 2 - 5 }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        }
                    Text(notice.excerpt)
                        .foregroundColor(getExcerptFontColor())
                        .fontWeight(.regular)
                        .padding(.bottom, 2)
                    Text(notice.date)
                        .foregroundColor(getDateFontColor())
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                Image("next.active")
            } // HStack
        } // VStack
    }
    
    func getTitleFontColor() -> Color {
        return notice.read ? .appSemiHighlight : .appTextPrimary
    }
    
    func getExcerptFontColor() -> Color {
        return notice.read ? .appSemiHighlight : .appTextPrimary
    }
    
    func getDateFontColor() -> Color {
        return notice.read ? .appSemiHighlight : .appSemiHighlight
    }
}

struct NoticeItemView_Previews : PreviewProvider {
    static let notice = Notice(type: NoticeType.ORDER, title: "주문이 성공적으로 처리되었습니다", excerpt: "아메리카노 외 3개 메뉴", date: "2020.10.17", read: false)
    
    static var previews: some View {
        NoticeItemView(notice: notice)
    }
}
