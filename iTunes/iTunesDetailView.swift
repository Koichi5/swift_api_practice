//
//  DetailView.swift
//  api_practice
//
//  Created by Koichi Kishimoto on 2023/08/09.
//

import SwiftUI

struct iTunesDetailView: View {
    var itemName: String
    var itemArtistName: String
    var itemFormattedPrice: String
    var body: some View {
        NavigationStack {
            VStack {
                Text("著者： \(itemArtistName)")
                Text("価格： \(itemFormattedPrice)")
            }
            .navigationTitle(itemName)
        }
    }
}

struct iTunesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        iTunesDetailView(itemName: "", itemArtistName: "", itemFormattedPrice: "")
    }
}
