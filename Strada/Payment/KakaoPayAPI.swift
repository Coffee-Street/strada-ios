//
//  KakaoPayAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/04/18.
//

import Foundation

struct KakaoPayAPI {
    
    struct ReadyRequest : Encodable {
        let cid: String
        let partnerOrderId: String
        let partnerUserId: String
        let itemName: String
        let quantity: Int
        let totalAmount: Int
        let vatAmount: Int
        let taxFreeAmount: Int
        
        let approvalUrl: String
        let failUrl: String
        let cancelUrl: String
        
        enum CodingKeys: String, CodingKey {
            case cid, partner_order_id, partner_user_id, item_name, quantity, total_amount, vat_amount, tax_free_amount, approval_url, fail_url, cancel_url
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(cid, forKey: .cid)
            try container.encode(partnerOrderId, forKey: .partner_order_id)
            try container.encode(partnerUserId, forKey: .partner_user_id)
            try container.encode(itemName.addingPercentEncoding(withAllowedCharacters: .letters), forKey: .item_name)
            try container.encode(quantity, forKey: .quantity)
            try container.encode(totalAmount, forKey: .total_amount)
            try container.encode(vatAmount, forKey: .vat_amount)
            try container.encode(taxFreeAmount, forKey: .tax_free_amount)
            try container.encode(approvalUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .approval_url)
            try container.encode(failUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .fail_url)
            try container.encode(cancelUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .cancel_url)
        }
    }
    
    struct ReadyResponse : Decodable {
        let tid: String
        let redirectAppUrl: String
        let redirectMobileUrl: String
        let redirectPcUrl: String
        let androidAppScheme: String
        let iosAppScheme: String
        let createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            case tid, next_redirect_app_url, next_redirect_mobile_url, next_redirect_pc_url, android_app_scheme, ios_app_scheme, created_at
        }
          
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.tid = try container.decode(String.self, forKey: .tid).removingPercentEncoding ?? ""
            self.redirectAppUrl = try container.decode(String.self, forKey: .next_redirect_app_url).removingPercentEncoding ?? ""
            self.redirectMobileUrl = try container.decode(String.self, forKey: .next_redirect_mobile_url).removingPercentEncoding ?? ""
            self.redirectPcUrl = try container.decode(String.self, forKey: .next_redirect_pc_url).removingPercentEncoding ?? ""
            self.androidAppScheme = try container.decode(String.self, forKey: .android_app_scheme).removingPercentEncoding ?? ""
            self.iosAppScheme = try container.decode(String.self, forKey: .ios_app_scheme).removingPercentEncoding ?? ""
            
            let RFC3339DateFormatter = DateFormatter()
            RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            let date_string = try container.decode(String.self, forKey: .created_at)
              
            self.createdAt = RFC3339DateFormatter.date(from: date_string) ?? Date()
        }
    }
    
    let api = API()
    let baseURL = "https://kapi.kakao.com/v1/payment"
    
    
    func ready(completion: @escaping (Result<KakaoPayReady, APIError>) -> Void) {
        guard let readyURL = URL(string: "\(baseURL)/ready") else {
            return completion(.failure(.invalidURL))
        }
        
        let queryJSON = try? JSONEncoder().encode(
            ReadyRequest(
                cid: "TC0ONETIME",
                partnerOrderId: "partner_order_id",
                partnerUserId: "partner_user_id",
                itemName: "초코파이",
                quantity: 1,
                totalAmount: 2200,
                vatAmount: 200,
                taxFreeAmount: 0,
                approvalUrl: "http://localhost:3000/success",
                failUrl: "http://localhost:3000/fail",
                cancelUrl: "http://localhost:3000/cancel"
            )
        )
        
        let queryDictionary = try? JSONSerialization.jsonObject(with: queryJSON ?? Data(), options: []) as? Dictionary<String, Any> ?? [:]
        
        let queryString = queryDictionary?.map {
            return "\($0.key)=\($0.value)"
        }.joined(separator: "&")
        
        let KAKAO_APP_KEY: String = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"

        var request = URLRequest(url: readyURL)
        request.httpMethod = "POST"
        request.addValue("KakaoAK \(KAKAO_APP_KEY)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = (queryString ?? "").data(using: .utf8)

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

            guard let result = try? JSONDecoder().decode(ReadyResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            let kakao = KakaoPayReady(tid: result.tid, appUrl: result.redirectAppUrl, mobileUrl: result.redirectMobileUrl, appScheme: result.iosAppScheme, createdAt: result.createdAt)
            completion(.success(kakao))
        }
        .resume()
    }
    
