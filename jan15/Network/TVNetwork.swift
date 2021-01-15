//
//  MovieApi.swift
//  jan15
//
//  Created by 황현지 on 2021/01/15.
//

import Foundation
import Moya

//1
enum TVNetwork {
    case airingToday
    case onTheAir
    case popular
    case topRated
}

//2
extension TVNetwork: TargetType {
    var baseURL: URL {
        guard let url = URL(string: API.baseURL+"/tv") else {
            fatalError("baseURL could not be configured" )
        }
        return url
    }
    
    
//3
    var path: String {
        switch self {
        case .airingToday:
            return "/airing_today"
        case .onTheAir:
            return "/on_the_air"
        case .popular:
            return "/popular"
        case .topRated:
            return "/top_rated"
        }
    }
    
//4
    var method: Moya.Method {
        switch self {
        case .airingToday, .onTheAir, .popular, .topRated:
            return .get
        }
    }
    
//5
    var sampleData: Data {
        switch self {
        case .airingToday, .onTheAir, .popular, .topRated:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .topRated, .popular, .onTheAir, .airingToday:
            return .requestParameters(parameters: ["api_key" : API.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
