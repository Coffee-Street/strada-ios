//
//  PaymentAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/04.
//

import Foundation

struct PaymentRequest : Codable {
    
}

struct PaymentResponse : Codable {
    
}

struct PaymentAPI {
    let api = API()
    
    func pay(completion: @escaping (Result<Payment, APIError>) -> Void) {
        
        guard let paymentURL = URL(string: "\(api.v1URL)/receipt") else {
            return completion(.failure(.invalidURL))
        }
        
        let body = try? JSONEncoder().encode(PaymentRequest())
        
        var request = URLRequest(url: paymentURL)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request)  { (data, response, error) in
//            guard error == nil else {
//
//            }
            
            if let response = response as? HTTPURLResponse, (500 ..< 600) ~= response.statusCode {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }
            
            guard let result = try? JSONDecoder().decode(PaymentResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            completion(.success(Payment()))
        }
        .resume()
    }
    func kakaoPayRequest() {
        //TODO: 결제 준비 이후 대기화면으로 이동하고 기다리기
        //      결제에 대한 3가지 상태에 따라 다른 곳으로 이동 가능함
        //      성공 -> approval_url 로 이동
        //      취소 -> cancel_url 로 이동
        //      요청 15분 이상 경과 -> fail_url 로 이동
        //      문제는 URL 방식이라서 App에서는 어떻게 돌려받을지 고민해봐야 할거 같음
    }
    
    func kakaoPayApprove() {
        //TODO: 결제 승인 후 pg_token을 받아오고 BE에 요청하기
    }
}
