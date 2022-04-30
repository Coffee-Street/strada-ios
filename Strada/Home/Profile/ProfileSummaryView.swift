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
                Text(saluteMessage)
                    .foregroundColor(.appBrownGray)
                    .font(.subheadline)
//                    .padding(.vertical, 5)
                Spacer()
                Text(profileSummary.phoneNumber)
                    .foregroundColor(.appBrownGray)
                    .font(.subheadline)
            }
            .frame(height: 46)
            .padding(.bottom, 10)
            
            HStack {
                Text("\(profileSummary.point)P")
                    .foregroundColor(.appBlue)
                    .font(.title)
                Image(systemName: "greaterthan")
                    .foregroundColor(.appBlue)
                    .font(.title)
                    .frame(width: 36, height: 36)
            }
        }
    }
}

struct ProfileSummaryView_Previews : PreviewProvider {
    @State static var profileSummary = ProfileSummary(phoneNumber: "010-0000-0000", point: 100000000)
    static var previews: some View {
        ProfileSummaryView(profileSummary: $profileSummary)
    }
}
