//
//  GitHubRepository.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/10.
//

struct GitHubRepository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
    }
}
