//
//  MoviesViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import Combine
import Foundation
import OrderedCollections

struct MovieMediaItem: MediaItem {
    typealias ResponseModel = TMDBMovieListResponseModel
    typealias API = TMDBApi
}

class MoviesViewModel: ObservableObject {
    @Published var moviesList: OrderedDictionary<Int, Movie> = [:]
    private var subscriptions = Set<AnyCancellable>()
    
    let movieFetcher = MediaItemFetcher<MovieMediaItem>()
    
    init() {
        subscribeToMovies()
    }
    
    // Subscribe to movies from the moviesFetcher.
    private func subscribeToMovies() {
        movieFetcher.getMediaListPublisher()
            .sink { tmdbMovieListModel in
                self.createMovies(from: tmdbMovieListModel)
            }
            .store(in: &subscriptions)
    }
    
    // Create the published model from the responseModel.
    private func createMovies(from model: TMDBMovieListResponseModel?) {
        if let tmdbMovieList = model?.results {
            for tmdbMovie in tmdbMovieList {
                let movie = Movie(tmdbMovie)
                DispatchQueue.main.async {
                    self.moviesList[movie.id] = movie
                }
            }
        }
    }
}
