//
//  SearchResultsView.swift
//  Movie
//
//  Created by MacBook Air on 06.06.24.
//
import SwiftUI

struct SearchResultsView: View {
    @Binding var searchText: String
    @StateObject private var viewModel = HomePageViewModel()

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(viewModel.movies.filter { searchText.isEmpty ? false : $0.title.localizedCaseInsensitiveContains(searchText) }) { movie in
                    VStack(alignment: .leading) {
                        if let url = viewModel.posterURL(for: movie) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 300)
                                        .cornerRadius(8)
                                default:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 300)
                                        .cornerRadius(8)
                                }
                            }
                            .frame(width: 200, height: 300)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 300)
                                .cornerRadius(8)
                        }
                        
                        Text(movie.title)
                            .font(.headline)
                            .padding(.top, 8)
                            .padding(.horizontal)
                            .lineLimit(2)
                            .frame(maxWidth: 200, alignment: .leading)
                    }
                }
            }
            .padding()
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchText: .constant(""))
    }
}
