//
//  ProfileView.swift
//  Strada
//
//  Created by 박종봉 on 2021/12/24.
//

import SwiftUI

struct ProfileView : View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("어서오세요").foregroundColor(.appBrownGray).font(.subheadline)
                        .padding(.vertical, 5)
                    Text("010-7702-3730").foregroundColor(.appBrownGray).font(.subheadline)
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("3,950P").foregroundColor(.appBlue)
                        .font(.title)
                    Image(systemName:"greaterthan").foregroundColor(.appBlue)
                        .font(.title)
                }
            }
            .padding(.leading, 15)
            Spacer()
        }
    }
}

struct ProfileView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
