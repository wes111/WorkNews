//
//  BooksViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import Foundation
import Combine
import OrderedCollections

class BooksViewModel: ObservableObject {
    @Published var bookList: OrderedDictionary<String, Book> = [:]
    var bookCount: Int?
    
    private var subscriptions = Set<AnyCancellable>()
    
    let googleBookFetcher = GoogleBookFetcher()
    
    init() {
        subscribeToBooks()
        subscribeToBookCount()
        subscribeToBookUpdates()
    }
    
    // Subscribe to books from the googleBookFetcher.
    private func subscribeToBooks() {
        googleBookFetcher.getMediaListPublisher()
            .sink { googleBooksResponseModel in
                self.createBooks(from: googleBooksResponseModel)
            }
            .store(in: &subscriptions)
    }
    
    // Subscribe to book updates from the googleBookFetcher
    private func subscribeToBookUpdates() {
        googleBookFetcher.getGoogleBookUpdatePublisher()
            .sink { googleBook in
                self.updateBook(from: googleBook)
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
        if let googleBookArray = model?.items {
            for googleBook in googleBookArray {
                let book = Book(googleBook, shouldStripHTML: false)
                DispatchQueue.main.async {
                    self.bookList[book.id] = book
                }
            }
        }
    }
    
    // Use a GoogleBook to update an existing book's information.
    private func updateBook(from googleBook: GoogleBook?) {
        guard let googleBook = googleBook else {
            // error
            return
        }
        var updatedBook = Book(googleBook, shouldStripHTML: true)
        updatedBook.hasReceivedUpdatedInfo = true
        DispatchQueue.main.async {
            self.bookList[updatedBook.id] = updatedBook
        }
    }
}
