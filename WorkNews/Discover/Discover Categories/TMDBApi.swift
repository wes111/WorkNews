//
//  TMDBapi.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import Foundation

struct TMDBApi: MediaItemAPI {
    private let apiKey = "9438268d5471093b1d0fc6f5a4e84126"
    private let movieListID = "8208287"
    private let baseListURL = "https://api.themoviedb.org/4/list"
    // 'w342' refers to the size of the image.
    private static let baseImageURL = "https://image.tmdb.org/t/p/w342"
    
    func createMediaListRequest(using token: String?) -> URLRequest? {
        let urlString = "\(baseListURL)/\(movieListID)"
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        guard let url = urlComponents?.url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    static func createMoviePosterURL(using imagePath: String) -> String {
        
        return "\(TMDBApi.baseImageURL)/\(imagePath)"
    }
}
