//
//  MovieAPI.swift
//  jan15
//
//  Created by 황현지 on 2021/01/15.
//

import Foundation
import Moya
import ProgressHUD

class MovieAPI {
    static let provider = MoyaProvider<MovieNetwork>()
    static let decoder = JSONDecoder()
    
    
    
    static func getMovieData(target: MovieNetwork, completion: @escaping ([Movie]) -> ()) {
        
        ProgressHUD.show()
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                // 데이터 파싱 후 파싱된 데이터를 던져줌
                
                do {
                    
                    let results = try decoder.decode(APIResults.self, from: response.data)
                    
                    completion(results.movies)
                    
                    ProgressHUD.dismiss()
                } catch let err {
                    print("parsingERR")
                    
                }
                ProgressHUD.dismiss()
                break
            case .failure(let err):
                print("!!!",err)
                ProgressHUD.dismiss()
                break
                
            }
        }
        
    }
//
//    static func getNowPlaying(completion: @escaping ([Movie]) -> ()) {
//        provider.request(.nowPlaying) { (result) in
//            switch result {
//            case .success(let response):
//                // 데이터 파싱 후 파싱된 데이터를 던져줌
//
//                do {
//                    let results = try decoder.decode(APIResults.self, from: response.data)
//
//                    completion(results.movies)
//
//                } catch let err {
//                    print("parsingERR")
//                }
//
//                break
//            case .failure(let err):
//                print("!!!",err)
//                break
//            }
//        }
//    }
//
//    static func getPopular(completion: @escaping ([Movie]) -> ()) {
//        provider.request(.popular) { (result) in
//            switch result {
//            case .success(let response):
//                // 데이터 파싱 후 파싱된 데이터를 던져줌
//
//                do {
//                    let results = try decoder.decode(APIResults.self, from: response.data)
//
//                    completion(results.movies)
//
//                } catch let err {
//                    print("parsingERR")
//                }
//
//                break
//            case .failure(let err):
//                print("!!!",err)
//                break
//            }
//        }
//    }
//
//
//    static func getTopRated(completion: @escaping ([Movie]) -> ()) {
//        provider.request(.popular) { (result) in
//            switch result {
//            case .success(let response):
//                // 데이터 파싱 후 파싱된 데이터를 던져줌
//
//                do {
//                    let results = try decoder.decode(APIResults.self, from: response.data)
//
//                    completion(results.movies)
//
//                } catch let err {
//                    print("parsingERR")
//                }
//
//                break
//            case .failure(let err):
//                print("!!!",err)
//                break
//            }
//        }
//    }
//
//    static func getUpcoming(completion: @escaping ([Movie]) -> ()) {
//        provider.request(.upComing) { (result) in
//            switch result {
//            case .success(let response):
//                // 데이터 파싱 후 파싱된 데이터를 던져줌
//
//                do {
//                    let results = try decoder.decode(APIResults.self, from: response.data)
//
//                    completion(results.movies)
//
//                } catch let err {
//                    print("parsingERR")
//                }
//
//                break
//            case .failure(let err):
//                print("!!!",err)
//                break
//            }
//        }
//    }
    
}
