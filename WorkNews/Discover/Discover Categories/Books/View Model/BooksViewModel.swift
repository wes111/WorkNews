//
//  BooksViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject {
    @Published var bookList: [Book] = []
    @Published var discoverBookList: [Book] = []
    @Published var bookCount: Int?
    
    private var subscriptions = Set<AnyCancellable>()
    
    let googleBookFetcher = GoogleBookFetcher()
    
    init() {
        subscribeToBooks()
        subscribeToBookCount()
        subscribeToBookUpdates()
    }
    
    // Subscribe to books from the googleBookFetcher.
    private func subscribeToBooks() {
        googleBookFetcher.getGoogleBooksPublisher()
            .sink { googleBooksResponseModel in
                self.createBooks(from: googleBooksResponseModel)
            }
            .store(in: &subscriptions)
    }
    
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
                    if self.discoverBookList.count < 10 {
                        self.discoverBookList.append(book)
                    }
                    self.bookList.append(book)
                }
            }
        }
    }
    
    private func updateBook(from googleBook: GoogleBook?) {
        guard let googleBook = googleBook else {
            // error
            return
        }
        let updatedBook = Book(googleBook, shouldStripHTML: true)
        for (index, book) in bookList.enumerated() {
            if book.id == updatedBook.id {
                DispatchQueue.main.async {
                    self.bookList[index] = updatedBook
                    //self.discoverBookList[index] = updatedBook
                }
            }
        }
    }
}
