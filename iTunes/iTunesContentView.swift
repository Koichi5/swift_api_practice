//
//  ContentView.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackViewUrl: String?
    var trackName: String?
    var artistName: String?
    var formattedPrice: String?
}

struct iTunesContentView: View {
//    初期状態としてからの Result のリストを作成
    @State private var results = [Result]()
    var body: some View {
        NavigationView {
            List (results, id: \.trackId) { item in
                NavigationLink(
                    destination: iTunesDetailView(
                        itemName: item.trackName ?? "",
                        itemArtistName: item.artistName ?? "",
                        itemFormattedPrice: item.formattedPrice ?? ""
                )) {
                    VStack (alignment: .leading) {
                        Text(item.trackName ?? "タイトルは取得できませんでした")      // 書籍タイトル
                            .font(.headline)
                        Text(item.artistName ?? "著者名は取得できませんでした")     // 著者名
                        Text(item.formattedPrice ?? "価格は取得できませんでした") // 価格
                    }
                }
            }.navigationTitle("SwiftUI 書籍リスト")
        }.onAppear {
            loadData()
        }
    }
    
    func loadData () {
        /// URLの生成
        /// 以下の URL は 検索ワード「swiftui」 国「日本」 メディアの種類「本」に限定して検索するよう指定している
        guard let url = URL(string: "https://itunes.apple.com/search?term=swiftui&country=jp&media=ebook")
        else {
            print("URL が有効ではありません。")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode(Response.self, from: data) else {
                    print("JSON decode error")
                    return
                }
                
                DispatchQueue.main.async {
                    results = decodedResponse.results
                }
            } else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
            }
        }.resume()
    }
}
