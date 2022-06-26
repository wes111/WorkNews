//
//  TMDBMovieFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import Combine
import Foundation

class TMDBMovieFetcher {
    
    private let decoder = JSONDecoder()
    private let tmbdAPI = TMDBApi()
    // This could have an initial value provided from local storage.
    private let tmdbMovieListSubject = CurrentValueSubject<TMDBMovieListResponseModel?, Never>(nil)
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        guard let request = tmbdAPI.createMovieListRequest() else { return }
        getMovieList(using: request)
    }
    
    func getTMDBMovieListPublisher() -> AnyPublisher<TMDBMovieListResponseModel?, Never> {
        return tmdbMovieListSubject.eraseToAnyPublisher()
    }
    
    private func getMovieList(using request: URLRequest) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    let playlist = try self.decoder
                        .decode(TMDBMovieListResponseModel.self, from: data)
                    self.tmdbMovieListSubject.send(playlist)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
