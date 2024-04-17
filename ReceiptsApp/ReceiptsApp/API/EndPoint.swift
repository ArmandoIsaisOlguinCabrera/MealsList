//
//  EndPoint.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 15/04/24.
//

import Foundation

enum EndPoint{
    case fetchMeals(url: String = "/api/json/v1/1/search.php")
    
    var request: URLRequest? {
        guard let url = self.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .fetchMeals(let url):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem]{
        switch self {
        case .fetchMeals:
            return [
                URLQueryItem(name: "f", value: "b")
            ]
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .fetchMeals:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchMeals:
            return nil
        }
    }
    
}

