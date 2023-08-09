//
//  GitHubAPIViewModel.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/10.
//

import Foundation

class GitHubAPIViewModel {
    private static var task: URLSessionTask?
    
    enum RepositoryError: Error {
        case wrongError
        case networkError
        case parseError
        case unknownError
    }
    
    static func fetchRepository (text: String, completion: @escaping ( Swift.Result<[Repository], RepositoryError> ) -> Void) {
        if !text.isEmpty {
            let urlString = "https://api.github.com/search/repositories?q=\(text)"
            guard let url = URL(string: urlString) else {
                completion(.failure(RepositoryError.wrongError))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) {( data, response, error ) in
                if error != nil {
                    completion(.failure(RepositoryError.networkError))
                    return
                }
                
                let decoder = JSONDecoder()
//                do {
//                    let decodedData = try? decoder.decode(Repository.self, from: data ?? <#default value#>)
//                }
            }
        }
    }
}
