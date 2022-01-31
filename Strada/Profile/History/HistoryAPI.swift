//
//  HistoryAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/31.
//

import Foundation

struct HistoryResponse : Codable {
    let title: String
    let point: String
    let date: String
}

struct HistoryAPI {
    
    private let api = API()
    
    func getHistories(completion: @escaping (Result<[History], APIError>) -> Void) {
        
        guard let historyURL = URL(string: "\(api.v1URL)/history") else {
            return completion(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: historyURL)
        request.httpMethod = "GET"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserDefaults.standard.string(forKey: "access_token") ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//                return completion(.failure())
//            }
            
            if let response = response as? HTTPURLResponse, (500 ..< 600) ~= response.statusCode {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }
            
            guard let result = try? JSONDecoder().decode([HistoryResponse].self, from: data) else {
                return completion(.failure(.decodingFailed))
            }
            
            let histories = result.map {
                History(title: $0.title, point: $0.point, date: $0.date)
            }
            
            completion(.success(histories))
        }
        .resume()
    }
}
