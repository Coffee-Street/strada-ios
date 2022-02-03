//
//  ReceiptAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/03.
//

import Foundation

struct ReceiptRequest : Codable {
    let id: Int
}

struct ReceiptResponse : Codable {
    let id: Int
    let status: Int
    let orderItems: [String]
}

struct ReceiptAPI {
    private var api = API()
    
    func getReceipt(id: Int, completion: @escaping (Result<Receipt, APIError>) -> Void) {
        
        guard let loginURL = URL(string: "\(api.v1URL)/receipt") else {
            return completion(.failure(.invalidURL))
        }
        
        let body = try? JSONEncoder().encode(ReceiptRequest(id: id))
        
        var request = URLRequest(url: loginURL)
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
            
            guard let result = try? JSONDecoder().decode(ReceiptResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            let receipt = Receipt(id: result.id, status: result.status, orderItems: result.orderItems)
            
            completion(.success(receipt))
        }
        .resume()
    }
}
