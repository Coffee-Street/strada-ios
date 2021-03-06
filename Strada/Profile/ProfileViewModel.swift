//
//  ProfileViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/20.
//

import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published var profile: Profile = Profile(id: -1, phoneNumber: "", point: 0)
    
    private var api = ProfileAPI()
    
    func getProfile() {
        api.getProfile() { result in
            switch(result) {
            case .success(let profile):
                DispatchQueue.main.async {
                    self.profile = profile
                }
            case .failure(let error):
                switch(error) {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("profile을 가져올 수 없습니다. \(error)")
                }
            }
        }
    }
}
