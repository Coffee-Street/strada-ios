//
//  HomeAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

struct BannerResponse : Codable {
    let code: String
    let title: String
    let imageUrl: String
    let message: String
    let backgroundColor: String
    let fontColor: String
}

struct HomeAPI {
    private var api = API()
    
    func getBanners(completion: @escaping (Result<[Banner], APIError>) -> Void) {
        
        guard let bannerURL = URL(string: "\(api.v1URL)/banners") else {
            return completion(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: bannerURL)
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
            
            guard let results = try? JSONDecoder().decode([BannerResponse].self, from: data) else {
                return completion(.failure(.decodingFailed))
            }
            
            let banners = results.map {
                Banner(title: $0.title, image: $0.imageUrl, name: $0.message, tags: [$0.code])
            }

            completion(.success(banners))
        }
        .resume()
    }
}
