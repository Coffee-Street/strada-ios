//
//  SignAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

struct LoginRequest : Codable {
    let phoneNumber: String
}

struct LoginResponse : Codable {
    let accessToken: String
}

struct SignAPI {
    private var api = API()
    
    func login(phoneNumber: String, completion: @escaping (Result<String, APIError>) -> Void) {
        
        guard let loginURL = URL(string: "\(api.v1URL)/account") else {
            return completion(.failure(.invalidURL))
        }
        
        print("make URL")
        
        let body = try? JSONEncoder().encode(LoginRequest(phoneNumber: phoneNumber))
        
        print("make Body")
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        print("make URLRequest")
        
        URLSession.shared.dataTask(with: request)  { (data, response, error) in
//            guard error == nil else {
//
//            }
            
            print("response URLSession")
            
            if let response = response as? HTTPURLResponse, (500 ..< 600) ~= response.statusCode {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }
            
            guard let result = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            completion(.success(result.accessToken))
        }
        .resume()
    }
}
