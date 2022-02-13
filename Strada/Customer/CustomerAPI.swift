//
//  CustomerAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/05.
//

import Foundation

struct FAQRequest : Codable {
    
}

struct FAQResponse : Codable {
    
}

struct CustomerAPI {
    let api = API()
    
    func getFAQ(completion: @escaping (Result<FAQ, APIError>) -> Void) {
        
        guard let paymentURL = URL(string: "\(api.v1URL)/faq") else {
            return completion(.failure(.invalidURL))
        }
        
        let body = try? JSONEncoder().encode(FAQRequest())
        
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
            
            guard let result = try? JSONDecoder().decode(FAQResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            completion(.success(FAQ()))
        }
        .resume()
    }
}
