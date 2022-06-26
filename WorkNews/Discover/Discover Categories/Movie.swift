//
//  Movie.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    let id: Int
    let title: String
    let genreIDs: [Int]
    let description: String
    let moviePosterURL: String
    let releaseDate: String
    let asyncImage: AsyncImageView
    
    init(_ tmdbMovie: TMDBMovieListResponseModel.Movie) {
        self.id = tmdbMovie.id
        self.title = tmdbMovie.title
        self.genreIDs = tmdbMovie.genre_ids
        self.description = tmdbMovie.overview
        self.moviePosterURL = TMDBApi.createMoviePosterURL(using: tmdbMovie.poster_path)
        self.releaseDate = tmdbMovie.release_date
        self.asyncImage = AsyncImageView(link: moviePosterURL, style: .movieCard, tryAgain: true)
    }
}
