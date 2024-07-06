//
//  ChuckNorrisFact.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 4.07.2024.
//

import Foundation

// MARK: - ChuckNorrisFact
struct ChuckNorrisFact: Codable {
    let categories: [String]?
    let createdAt: String?
    let iconURL: String?
    let id, updatedAt: String?
    let url: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
