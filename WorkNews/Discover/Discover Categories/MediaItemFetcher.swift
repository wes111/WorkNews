//
//  TMDBMovieFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import Combine
import Foundation

protocol MediaItem {
    associatedtype ResponseModel: Decodable
    associatedtype API: MediaItemAPI
}

protocol MediaItemAPI {
    func createMediaListRequest(using token: String?) -> URLRequest?
    init()
}

class MediaItemFetcher<T: MediaItem>  {
    
    // This could have an initial value provided from local storage.
    private let mediaListSubject = CurrentValueSubject<T.ResponseModel?, Never>(nil)
    let api = T.API()
    let decoder = JSONDecoder()
    var subscriptions = Set<AnyCancellable>()
    
    // If a fetcher needs a token to create the request, override this init.
    init() {
        guard let request = api.createMediaListRequest(using: nil) else { return }
        getMediaList(using: request)
    }
    
    func getMediaListPublisher() -> AnyPublisher<T.ResponseModel?, Never> {
        return mediaListSubject.eraseToAnyPublisher()
    }
    
    func getMediaList(using request: URLRequest) {
        makeRequest(using: request) { data in
            let mediaList = try self.decoder
                .decode(T.ResponseModel.self, from: data)
            self.mediaListSubject.send(mediaList)
        }
    }
    
    func makeRequest(using request: URLRequest, completion: @escaping (Data) throws -> () ) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    try completion(data)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
