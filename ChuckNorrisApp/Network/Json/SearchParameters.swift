//
//  SearchParameters.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 4.07.2024.
//

import Foundation

struct SearchParameters: Codable {
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case category
    }
}
