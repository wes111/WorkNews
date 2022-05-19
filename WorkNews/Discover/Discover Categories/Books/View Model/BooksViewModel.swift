//
//  BooksViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject {
    @Published var publishedBooks: [Book] = []
    private let googleBookFetcher = GoogleBookFetcher()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        receiveEvents()
    }
    
    // Subscribe to books from the googleBookFetcher.
    func receiveEvents() {
        googleBookFetcher.getGoogleBooks()
            .sink { model in
                self.createSeatGeekEvents(from: model)
            }
            .store(in: &subscriptions)
    }
    
    // Create the published model from the responseModel.
    func createSeatGeekEvents(from model: GoogleBooksResponseModel?) {
        var books: [Book] = []
        if let googleBookArray = model?.items {
            for googleBook in googleBookArray {
                let book = Book(googleBook)
                books.append(book)
            }
        }
        DispatchQueue.main.async {
            self.publishedBooks = books
        }
    }
    
}
