//
//  ProfileAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/31.
//

import Foundation

struct ProfileAPI {
    
    private let api = API()
    
    func getProfile(completion: @escaping (Result<Profile, APIError>) -> Void) {
        
        guard let profileURL = URL(string: "\(api.v1URL)/profiles") else {
            return completion(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: profileURL)
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
            
            guard let result = try? JSONDecoder().decode(ProfileResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            let profile = Profile(id: result.id, phoneNumber: result.userId, point: result.point)
            
            completion(.success(profile))
        }
        .resume()
    }
}
