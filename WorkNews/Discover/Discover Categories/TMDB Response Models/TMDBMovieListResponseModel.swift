//
//  MovieResponseModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import Foundation

struct TMDBMovieListResponseModel: Decodable {
    let results: [Movie]
    
    struct Movie: Decodable {
        let id: Int
        let title: String
        let genre_ids: [Int]
        let overview: String
        let poster_path: String
        let release_date: String
    }
}

