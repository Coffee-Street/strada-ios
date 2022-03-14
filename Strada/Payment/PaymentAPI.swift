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

struct KakaoPaymentReadyRequest : Codable {
    let cid: String
    let partner_order_id: String
    let partner_user_id: String
    let item_name: String
    let quantity: Int
    let total_amount: Int
    let vat_amount: Int
    let tax_free_amount: Int
    
    let approval_url: String
    let fail_url: String
    let cancel_url: String
}

struct KakaoPaymentReadyResponse : Codable {
    let tid: String
    let next_redirect_app_url: String
    let next_redirect_mobile_url: String
    let next_redirect_pc_url: String
    let android_app_scheme: String
    let ios_app_scheme: String
    let created_at: Date
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
    
    func kakaoPayReady(completion: @escaping (Result<KakaoPayment, APIError>) -> Void) {
        
        guard let kakaoPaymentURL = URL(string: "https://kapi.kakao.com/v1/payment/ready") else {
            return completion(.failure(.invalidURL))
        }
        
        let body = try? JSONEncoder().encode(
            KakaoPaymentReadyRequest(
                cid: "TC0ONETIME",
                partner_order_id: "partner_order_id",
                partner_user_id: "partner_user_id",
                item_name: "초코파이",
                quantity: 1,
                total_amount: 2200,
                vat_amount: 200,
                tax_free_amount: 0,
                approval_url: "http://localhost:3000/success",
                fail_url: "http://localhost:3000/fail",
                cancel_url: "http://localhost:3000/cancel"
            )
        )
        
        print(String(data: body ?? Data(), encoding: .utf8)!)
        
        let KAKAO_APP_KEY: String = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"

        var request = URLRequest(url: kakaoPaymentURL)
        request.httpMethod = "POST"
        request.addValue("KakaoAK \(KAKAO_APP_KEY)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/x-www-form-urlencoded;charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.addValue("*", forHTTPHeaderField: "Access-Control-Allow-Origin")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//
//            }
            
            let response = response as? HTTPURLResponse
            
            if (500 ..< 600) ~= response?.statusCode ?? 500 {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }
            
            guard let result = try? JSONDecoder().decode(KakaoPaymentReadyResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            completion(.success(KakaoPayment(tid: result.tid)))
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
