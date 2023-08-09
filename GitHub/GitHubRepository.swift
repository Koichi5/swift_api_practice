//
//  GitHubRepository.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/10.
//

import Foundation

struct Repositories: Codable {
    let items: [Repository]
}

struct Repository: Codable {
    let name: String
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let description: String?

    let owner: Owner

    var avatarImageUrl: URL? {
        return URL(string: owner.avatarUrl)
    }
}

struct Owner: Codable {
    let avatarUrl: String
    let login: String
}
