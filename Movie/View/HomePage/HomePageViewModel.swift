//
//  MoviePageViewModel.swift
//  Movie
//
//  Created by MacBook Air on 05.06.24.
//

import Foundation
import Networking

class HomePageViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=7c83c4473e6ccc712af6dfc737739db1"
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        guard let url = URL(string: apiURL) else {
            print("Invalid URL")
            return
        }
        
        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    self?.movies = movieResponse.results
                }
            case .failure(let error):
                print("Failed to fetch movies:", error.localizedDescription)
            }
        }
    }
    
    func posterURL(for movie: Movie) -> URL? {
        guard let posterPath = movie.posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}
