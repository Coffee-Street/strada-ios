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
    let id: String
    let status: Int
    
    let createdAt: Date
    let respondTo: Date
    let doneOn: Date
    
    let orderItems: [String]
}

struct ReceiptAPI {
    private var api = API()
    
    func getReceipt(id: Int, completion: @escaping (Result<Receipt, APIError>) -> Void) {
        
        guard let receiptURL = URL(string: "\(api.v1URL)/receipt") else {
            return completion(.failure(.invalidURL))
        }
        
        let body = try? JSONEncoder().encode(ReceiptRequest(id: id))
        
        var request = URLRequest(url: receiptURL)
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

            let receipt = Receipt(id: result.id, status: ReceiptStatus(rawValue: result.status) ?? ReceiptStatus.UNACCEPTED, createdAt: result.createdAt, respondTo: result.respondTo, doneOn: result.doneOn, orderItems: result.orderItems)
            
            completion(.success(receipt))
        }
        .resume()
    }
}
