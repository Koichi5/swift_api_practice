//
//  GitHubContentView.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/10.
//

import SwiftUI
import Combine

struct GitHubContentView: View {
    @State private var repositories: [GitHubRepository] = []
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var showingAlert = false
    @State private var errorMessage = ""
    @State private var searchText = ""
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                TextField(text: $searchText) {
                    Text("検索")
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    isLoading = true
                    GithubAPIViewModel.searchRepositories(word: searchText, page: 1, perPage: 30)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .finished:
                                break
                            case let .failure(error):
                                self.showingAlert = true
                                self.errorMessage = error.localizedDescription
                            }
                        }, receiveValue: { repositories in
                            isLoading = false
                            self.repositories = repositories
                        })
                        .store(in: &self.subscriptions)
                }
                if (repositories == [] && isLoading == false) {
                    VStack {
                        Spacer()
                        Text("リポジトリを検索してみましょう")
                        Spacer()
                    }
                } else if (repositories == [] && isLoading == true) {
                    VStack {
                        Spacer()
                        ActivityIndicator()
                        Spacer()
                    }
                }
                else {
                    List(repositories) { repository in
                        VStack(alignment: .leading) {
                            Text(repository.name)
                                .font(Font.system(size: 24).bold())
                            Text(repository.description ?? "")
                                .padding(.vertical, 5)
                            HStack {
                                Image(systemName: "star.fill")
                                    .padding(.trailing, 3)
                                Text("\(repository.stargazersCount)")
                            }
                        }
                    }
                    .alert(isPresented: self.$showingAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(self.errorMessage),
                            dismissButton: .default(Text("Close")))
                    }
                }
            }
            .navigationTitle("GitHub リポジトリ検索")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GitHubContentView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubContentView()
    }
}
