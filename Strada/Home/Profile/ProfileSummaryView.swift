//
//  ProfileSummaryView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

struct ProfileSummaryView : View {
    
    @Binding var profileSummary: ProfileSummary
    
    private let saluteMessage: String = "어서오세요"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(saluteMessage).foregroundColor(.appBrownGray).font(.subheadline)
                    .padding(.vertical, 5)
                Text(profileSummary.phoneNumber).foregroundColor(.appBrownGray).font(.subheadline)
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("\(profileSummary.point)P").foregroundColor(.appBlue)
                    .font(.title)
                Image(systemName:"greaterthan").foregroundColor(.appBlue)
                    .font(.title)
            }
        }
        .padding(.leading, 15)
    }
}

struct ProfileSummaryView_Previews : PreviewProvider {
    @State static var profileSummary = ProfileSummary(phoneNumber: "010-7702-3730", point: 3950)
    static var previews: some View {
        ProfileSummaryView(profileSummary: $profileSummary)
    }
}
