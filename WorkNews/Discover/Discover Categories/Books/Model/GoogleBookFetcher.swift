//
//  GoogleBookFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/17/22.
//

import Combine
import Foundation

struct GoogleBookFetcher {
    
    private static let baseURL = "https://www.googleapis.com/books/v1/users/103818017356926243835/bookshelves/"
    private static let bookshelfID = "1001"
    private static let baseURLEnd = "/volumes?key="
    private static let googleAPIKey = "AIzaSyD3ycl7G_X7ZJIm3pD6nFLz8ZgMPjbGupc"
    private static let url = baseURL + bookshelfID + baseURLEnd + googleAPIKey

    private let decoder = JSONDecoder()
    
    // This could have an initial value provided from local storage.
    private let googleBooksSubject = CurrentValueSubject<GoogleBooksResponseModel?, Never>(nil)
    
    init() {
        requestEvents()
    }
    
    func getGoogleBooks() -> AnyPublisher<GoogleBooksResponseModel?, Never> {
        return googleBooksSubject.eraseToAnyPublisher()
    }
    
    func requestEvents() {
        if let url = URL(string: GoogleBookFetcher.url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    do {
                        let googleBooksData = try self.decoder
                            .decode(GoogleBooksResponseModel.self, from: safeData)
                        self.googleBooksSubject.send(googleBooksData)
                    } catch {
                        print(error)
                    }
                } else {
                    print("Error receiving data from URL.")
                }
            }
            task.resume()
        }
    }
}

