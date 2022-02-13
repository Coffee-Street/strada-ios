//
//  SignViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

class SignViewModel : ObservableObject {
    
    @Published var phoneNumber: String = ""
    @Published var isAutoLogin: Bool = false
    @Published var isLoginSucceed: Bool = false
    
    @Published var error: APIError = .none

    private var api = SignAPI()
    
    func login(callback: @escaping () -> Void) {
        print("before api login")
        
        self.api.login(phoneNumber: self.phoneNumber) { result in
            switch result {
            case .success(let accessToken):
                print("success value: \(accessToken)")
                
                DispatchQueue.main.async {
                    UserDefaults.standard.setValue(accessToken, forKey: "access_token")
                    self.isLoginSucceed = true
                    callback()
                }
            case .failure(let error):
                switch error {
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    DispatchQueue.main.async {
                        print("error: \(error)")
                        self.error = error
                        callback()
                    }
                }
            }
        }
        
        print("after api login")
    }
    
    func getErrorMessage() -> String {
        switch self.error {
        case .none:
            return "에러가 발생하지 않았습니다."
        case .invalidRequest:
            return "유효하지 않은 입력값입니다. 다시 확인해주세요."
            
        case .invalidURL: fallthrough
        case .invalidResponse: fallthrough
        case .invalidResponseData: fallthrough
            
        default:
            return "알 수 없는 에러가 발생했습니다. 관리자에게 연락이 필요합니다."
        }
    }
}
