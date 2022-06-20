//
//  GoogleAPI.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation

struct GoogleAPI {
    private let bookshelfID = "1001"
    private let userID = "103818017356926243835"
    private let key = "AIzaSyD3ycl7G_X7ZJIm3pD6nFLz8ZgMPjbGupc"
    private let baseURL = "https://www.googleapis.com/books/v1/"
    private var baseURLWithUser: String { "\(baseURL)users/" }
    
    let defaultBooksPerFetch = 10
    var requestGoogleBooksURL: String { "\(baseURLWithUser)\(userID)/bookshelves/\(bookshelfID)/volumes?key=\(key)&startIndex=" }
    
    var requestGoogleBookCountURL: String { "\(baseURLWithUser)\(userID)/bookshelves/\(bookshelfID)?key=\(key)" }
    
    var requestGoogleVolumeURL: String { "\(baseURL)volumes/" }
}
