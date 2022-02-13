//
//  HomeViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var profileSummary: ProfileSummary = ProfileSummary(phoneNumber: "010-7702-3730", point: 3950)
    
    @Published var banners: [Banner] = [
        Banner(title: "달콤한 케이크\n추천해요!", image: "cup.and.saucer", name: "초콜릿 케이크", tags: ["1piece","4,000원"]),
        Banner(title: "달콤한 케이크\n추천해요!", image: "takeoutbag.and.cup.and.straw", name: "초콜릿 케이크", tags: ["1piece","4,000원"])
    ]
    
    private var api = HomeAPI()
    
    func getProfile() {
        api.getProfile() { result in
            switch result {
            case .success(let profileSummary):
                DispatchQueue.main.async {
                    self.profileSummary = profileSummary
                }
            case .failure(let error):
                switch error {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("에러가 발생했습니다. \(error)")
                }
            }
        }
    }
    
    func getBanners() {
        api.getBanners() { result in
            switch result {
            case .success(let banners):
                DispatchQueue.main.async {
                    self.banners = banners
                }
            case .failure(let error):
                switch error {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("에러가 발생했습니다. \(error)")
                }
            }
        }
    }
}
