//
//  GoogleAPI.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation

struct GoogleAPI: MediaItemAPI {
    private let bookshelfID = "1001"
    private let userID = "103818017356926243835"
    private let key = "AIzaSyD3ycl7G_X7ZJIm3pD6nFLz8ZgMPjbGupc"
    private let baseURL = "https://www.googleapis.com/books/v1/"
    private var baseURLWithUser: String { "\(baseURL)users/" }
    
    let defaultBooksPerFetch = 10
    var count: Int?
    
    func createMediaListRequest() -> URLRequest? {
        guard let count = count else { return nil }
        let requestGoogleBooksURL = "\(baseURLWithUser)\(userID)/bookshelves/\(bookshelfID)/volumes?key=\(key)&startIndex="
        let urlString = "\(requestGoogleBooksURL)\(count)"
        return createRequest(from: urlString)
    }
    
    func createBookCountRequest() -> URLRequest? {
        let urlString = "\(baseURLWithUser)\(userID)/bookshelves/\(bookshelfID)?key=\(key)"
        return createRequest(from: urlString)
    }
    
    func createAdditionalBookDetailsRequest(using id: String) -> URLRequest? {
        let requestGoogleVolumeURL = "\(baseURL)volumes/"
        let urlString = requestGoogleVolumeURL + id
        return createRequest(from: urlString)
    }
    
    func createRequest(from urlString: String) -> URLRequest? {
        let url = URL(string: urlString)
        guard let url = url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
}
