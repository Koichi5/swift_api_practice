//  GitHubAPIViewModel.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/10.
//
//
import Combine
import Foundation

struct GithubSearchResult: Codable {
    let items: [GitHubRepository]
}

class GithubAPIViewModel {
    static func searchRepos(word: String, page: Int, perPage: Int) -> AnyPublisher<[GitHubRepository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(word)&sort=stars&page=\(page)&per_page=\(perPage)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GithubSearchResult.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
