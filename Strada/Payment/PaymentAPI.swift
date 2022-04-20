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
}
