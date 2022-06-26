//
//  GoogleBookFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/17/22.
//

import Combine
import Foundation

struct BookMediaItem: MediaItem {
    typealias ResponseModel = GoogleBooksResponseModel
    typealias API = GoogleAPI
}

class GoogleBookFetcher: MediaItemFetcher<BookMediaItem> {

    private let googleBookCountSubject = CurrentValueSubject<Int?, Never>(nil)
    private let googleBookUpdateSubject = PassthroughSubject<GoogleBook?, Never>()
    private var fetchedBookCount = 0
    private let shouldFetchAllBooks = false
    
    override init() {
        super.init()
        requestGoogleBookCount()
        requestGoogleBooks(startingAt: 0)
    }
    
    func getAdditionalBookDetails(id: String) {
        guard let request = api.createAdditionalBookDetailsRequest(using: id) else { return }
        makeRequest(using: request) { data in
            let googleBook = try self.decoder
                .decode(GoogleBook.self, from: data)
            self.googleBookUpdateSubject.send(googleBook)
        }
    }
    
    func tryToFetchAllBooks(){
        guard let totalBooks = googleBookCountSubject.value else { return }
        while fetchedBookCount < totalBooks {
            requestGoogleBooks(startingAt: fetchedBookCount)
        }
    }
    
    func getGoogleBookCountPublisher() -> AnyPublisher<Int?, Never> {
        return googleBookCountSubject.eraseToAnyPublisher()
    }
    
    func getGoogleBookUpdatePublisher() -> AnyPublisher<GoogleBook?, Never> {
        return googleBookUpdateSubject.eraseToAnyPublisher()
    }
    
    private func requestGoogleBooks(startingAt index: Int) {
        api.count = index
        guard let request = api.createMediaListRequest() else { return }
        getMediaList(using: request)
        fetchedBookCount += api.defaultBooksPerFetch
    }
    
    private func requestGoogleBookCount() {
        guard let request = api.createBookCountRequest() else { return }
        makeRequest(using: request ) { data in
            let googleBookCountData = try self.decoder
                .decode(GoogleBookShelfResponseModel.self, from: data)
            self.googleBookCountSubject.send(googleBookCountData.volumeCount)
        }
    }
}

