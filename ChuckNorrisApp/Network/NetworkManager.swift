//
//  NetworkManager.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 4.07.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getRandomFact(completionHandler: @escaping (ChuckNorrisFact?, String?) -> Void) {
        AF.request("https://api.chucknorris.io/jokes/random", method: .get)
            .validate()
            .responseDecodable(of: ChuckNorrisFact.self) { (response) in
            if let fact = response.value {
               completionHandler(fact, nil)
            } else if let error = response.error {
                completionHandler(nil, error.errorDescription)
            } else {
                completionHandler(nil, "Unknown Error")
            }
        }
    }
    
    func getCategories(completionHandler: @escaping ([String]?, String?) -> Void) {
        
        AF.request("https://api.chucknorris.io/jokes/categories", method: .get)
            .validate()
            .responseDecodable(of: [String].self) { (response) in
            
            
            if let categories = response.value {
                completionHandler(categories, nil)
            } else if let error = response.error {
                completionHandler(nil, error.errorDescription)
            } else {
                completionHandler(nil, "Unknown Error")
            }
        }
    }
    
    func getRandomFact(from category: String,
                       completionHandler: @escaping (ChuckNorrisFact?, String?) -> Void) {
        AF.request("https://api.chucknorris.io/jokes/random", method: .get, parameters: SearchParameters(category: category), encoder: URLEncodedFormParameterEncoder.default)
            .validate()
            .responseDecodable(of: ChuckNorrisFact.self) { (response) in
            if let fact = response.value {
               completionHandler(fact, nil)
            } else if let error = response.error {
                completionHandler(nil, error.errorDescription)
            } else {
                completionHandler(nil, "Unknown Error")
            }
        }
    }
    
    func getFact(from factID: String,
                 completionHandler: @escaping (ChuckNorrisFact?, String?) -> Void) {
        AF.request("https://api.chucknorris.io/jokes/\(factID)", method: .get)
            .validate()
            .responseDecodable(of: ChuckNorrisFact.self) { (response) in
            if let fact = response.value {
               completionHandler(fact, nil)
            } else if let error = response.error {
                completionHandler(nil, error.errorDescription)
            } else {
                completionHandler(nil, "Unknown Error")
            }
        }
    }
    
}
