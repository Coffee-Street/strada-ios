//
//  API.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/29.
//

import Foundation

enum APIError : Error {
    case none
    case invalidURL
    case invalidRequest
    case invalidResponse
    case invalidResponseData
    case decodingFailed
}

struct API {
    private let baseURL: String
    private let applicationPath: String
    let v1URL: String
    
    init() {
        baseURL = "http://localhost:8080"
        applicationPath = "strada"
        v1URL = "\(self.baseURL)/\(applicationPath)/v1"
    }
}
