//
//  BooksViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject {
    @Published var publishedFullList: [Book] = []
    @Published var publishedDiscoverList: [Book] = []
    @Published var bookCount: Int?
    
    private var subscriptions = Set<AnyCancellable>()
    
    let googleBookFetcher = GoogleBookFetcher()
    
    init() {
        subscribeToBooks()
        subscribeToBookCount()
    }
    
    // Subscribe to books from the googleBookFetcher.
    private func subscribeToBooks() {
        googleBookFetcher.getGoogleBooksPublisher()
            .sink { googleBooksResponseModel in
                self.createBooks(from: googleBooksResponseModel)
            }
            .store(in: &subscriptions)
    }
    
    // Subscribe to book count from the googleBookFetcher.
    private func subscribeToBookCount() {
        googleBookFetcher.getGoogleBookCountPublisher()
            .sink { bookCount in
                DispatchQueue.main.async {
                    self.bookCount = bookCount
                }
            }
            .store(in: &subscriptions)
    }
    
    // Create the published model from the responseModel.
    private func createBooks(from model: GoogleBooksResponseModel?) {
        var books: [Book] = []
        if let googleBookArray = model?.items {
            for googleBook in googleBookArray {
                let book = Book(googleBook)
                books.append(book)
            }
        }
        DispatchQueue.main.async {
            if self.publishedDiscoverList.isEmpty {
                self.publishedDiscoverList += books
            }
            self.publishedFullList += books
        }
    }
    
}
