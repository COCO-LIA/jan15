//
//  MovieAPI.swift
//  jan15
//
//  Created by 황현지 on 2021/01/15.
//

import Foundation
import Moya

enum MovieNetwork {
    case nowPlaying
    case popular
    case topRated
    case upComing
}

extension MovieNetwork: TargetType {
    var baseURL: URL {
        guard let url = URL(string: API.baseURL+"/movie") else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
        
    var path: String {
        switch self {
        case .nowPlaying:
            return "/now_playing"
        case .popular:
            return "/popular"
        case .topRated:
            return "/top_rated"
        case .upComing:
            return "/upcoming"
        }
    }

    var method: Moya.Method {
        switch self {
        case .nowPlaying, .popular, .topRated, .upComing:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .nowPlaying, .popular, .topRated, .upComing:
            return Data()
        }
    }

    var task: Task {
        switch self {
        case .nowPlaying, .popular, .topRated, .upComing:
            return .requestParameters(parameters: ["api_key" : API.apiKey], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }


}




